-- Executar após schema.sql e dados-ficticios.sql em banco descartável.
-- As alterações dos testes são revertidas ao final.
BEGIN;
CREATE FUNCTION pg_temp.verificar(ok boolean, descricao text) RETURNS void
LANGUAGE plpgsql AS $$ BEGIN
 IF ok IS DISTINCT FROM true THEN RAISE EXCEPTION 'FALHOU: %', descricao; END IF;
 RAISE NOTICE 'PASSOU: %', descricao;
END; $$;
CREATE FUNCTION pg_temp.esperar_erro(comando text, trecho text) RETURNS void
LANGUAGE plpgsql AS $$ DECLARE falhou boolean := false; BEGIN
 BEGIN EXECUTE comando;
 EXCEPTION WHEN OTHERS THEN
   IF position(trecho IN SQLERRM) = 0 THEN RAISE; END IF;
   falhou := true;
 END;
 PERFORM pg_temp.verificar(falhou, trecho);
END; $$;

SELECT pg_temp.verificar((SELECT count(*) = 13 FROM information_schema.tables
 WHERE table_schema = 'bispo_bd' AND table_type = 'BASE TABLE'), '13 tabelas criadas');
SELECT pg_temp.verificar((SELECT count(*) = 3 FROM bispo_bd.submissao_anonima), 'carga com 3 submissões');
SELECT pg_temp.verificar((SELECT count(*) = 3 FROM bispo_bd.participacao WHERE finalizada), '3 participações finalizadas');
SELECT pg_temp.verificar((SELECT count(*) = 3 FROM bispo_bd.token_individual WHERE consumido), '3 tokens consumidos');
SELECT pg_temp.verificar((SELECT count(*) = 6 FROM bispo_bd.resposta_opcao), '6 escolhas fictícias');
SELECT pg_temp.verificar(NOT EXISTS (SELECT 1 FROM information_schema.columns
 WHERE table_schema='bispo_bd' AND table_name IN ('submissao_anonima','resposta_anonima','resposta_opcao')
 AND column_name IN ('identidade_id','participacao_id','token_id','ip','criado_em')), 'sem coluna de vínculo nominal nas respostas');

SELECT pg_temp.esperar_erro($q$INSERT INTO bispo_bd.participacao(pesquisa_id,identidade_id) VALUES(1,2)$q$, 'unique');
SELECT pg_temp.esperar_erro($q$INSERT INTO bispo_bd.participacao(pesquisa_id,identidade_id) VALUES(1,99999)$q$, 'foreign key');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'invalido','[]')$q$, 'Acesso inválido');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(2,'ficticio-3','[]')$q$, 'Acesso inválido');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-1','[]')$q$, 'já finalizada');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','{}')$q$, 'lista');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[]')$q$, 'sem respostas');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":null,"opcoes":[1]}]')$q$, 'Formato');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":1,"opcoes":["1"]}]')$q$, 'Número');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":1,"opcoes":[1]}]')$q$, 'obrigatória ausente');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":1,"opcoes":[1,2]},{"questao_id":2,"opcoes":[1]}]')$q$, 'seleção única');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":1,"opcoes":[1]},{"questao_id":2,"opcoes":[1,1]}]')$q$, 'Opção repetida');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":1,"opcoes":[1]},{"questao_id":1,"opcoes":[2]},{"questao_id":2,"opcoes":[1]}]')$q$, 'Questão repetida');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":1,"opcoes":[1]},{"questao_id":2,"opcoes":[1]},{"questao_id":3,"opcoes":[1]}]')$q$, 'fora do questionário');
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":1,"opcoes":[1]},{"questao_id":2,"opcoes":[999]}]')$q$, 'foreign key');
SELECT pg_temp.verificar((SELECT count(*)=3 FROM bispo_bd.submissao_anonima), 'falhas não deixam submissões parciais');
SELECT pg_temp.verificar((SELECT NOT finalizada FROM bispo_bd.participacao WHERE id=3), 'falhas preservam participação');
SELECT pg_temp.verificar((SELECT NOT consumido FROM bispo_bd.token_individual WHERE participacao_id=3), 'falhas preservam token');

-- Falha deliberada depois de consumir token: toda a função precisa ser desfeita.
CREATE FUNCTION pg_temp.falhar_finalizacao() RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN RAISE EXCEPTION 'falha induzida após consumo'; END; $$;
CREATE TRIGGER falha_de_teste AFTER UPDATE ON bispo_bd.participacao
 FOR EACH ROW WHEN (NEW.id=3 AND NEW.finalizada) EXECUTE FUNCTION pg_temp.falhar_finalizacao();
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[{"questao_id":1,"opcoes":[1]},{"questao_id":2,"opcoes":[1]}]')$q$, 'falha induzida');
SELECT pg_temp.verificar((SELECT count(*)=3 FROM bispo_bd.submissao_anonima)
 AND (SELECT NOT consumido FROM bispo_bd.token_individual WHERE participacao_id=3)
 AND (SELECT NOT finalizada FROM bispo_bd.participacao WHERE id=3), 'rollback após gravação e consumo');
DROP TRIGGER falha_de_teste ON bispo_bd.participacao;

INSERT INTO bispo_bd.participacao(id,pesquisa_id,identidade_id) VALUES(100,1,1);
DELETE FROM bispo_bd.participacao WHERE id=100;
SELECT pg_temp.verificar(NOT EXISTS(SELECT 1 FROM bispo_bd.participacao WHERE id=100), 'DELETE de participação pendente executado');

SELECT pg_temp.esperar_erro($q$UPDATE bispo_bd.questao SET enunciado='alterado' WHERE id=1$q$, 'rascunho');
SELECT pg_temp.esperar_erro($q$DELETE FROM bispo_bd.opcao WHERE questao_id=1 AND numero=3$q$, 'rascunho');
SELECT pg_temp.esperar_erro($q$UPDATE bispo_bd.pesquisa SET estado='rascunho' WHERE id=1$q$, 'Transição');
UPDATE bispo_bd.pesquisa SET estado='encerrada' WHERE id=1;
SELECT pg_temp.esperar_erro($q$SELECT bispo_bd.finalizar(1,'ficticio-3','[]')$q$, 'indisponível');
SELECT pg_temp.esperar_erro($q$UPDATE bispo_bd.pesquisa SET estado='aberta' WHERE id=1$q$, 'Transição');
-- Reverte somente o bloco de fechamento para continuar os testes com a carga original.
ROLLBACK;

BEGIN;
-- Função não pode ser desviada por tabelas temporárias do chamador.
CREATE TEMP TABLE submissao_anonima (LIKE bispo_bd.submissao_anonima INCLUDING ALL);
CREATE TEMP TABLE participacao (LIKE bispo_bd.participacao INCLUDING ALL);
SELECT bispo_bd.finalizar(1,'ficticio-4','[{"questao_id":1,"opcoes":[1]},{"questao_id":2,"opcoes":[1,3]}]');
DO $$ BEGIN
 IF (SELECT count(*) FROM bispo_bd.submissao_anonima) <> 4
   OR (SELECT count(*) FROM pg_temp.submissao_anonima) <> 0 THEN
   RAISE EXCEPTION 'FALHOU: isolamento do search_path';
 END IF;
 RAISE NOTICE 'PASSOU: search_path protegido e seleção múltipla válida';
END; $$;
ROLLBACK;

BEGIN;
-- Perfil mínimo simula o futuro backend: apenas executar a função, sem tabelas.
CREATE ROLE bispo_teste_execucao NOLOGIN;
GRANT USAGE ON SCHEMA bispo_bd TO bispo_teste_execucao;
GRANT EXECUTE ON FUNCTION bispo_bd.finalizar(bigint,text,jsonb) TO bispo_teste_execucao;
SET LOCAL ROLE bispo_teste_execucao;
DO $$ BEGIN
 BEGIN
   INSERT INTO bispo_bd.submissao_anonima(pesquisa_id) VALUES(1);
   RAISE EXCEPTION 'FALHOU: escrita direta permitida';
 EXCEPTION WHEN insufficient_privilege THEN RAISE NOTICE 'PASSOU: escrita direta negada'; END;
 BEGIN
   PERFORM 1 FROM bispo_bd.resposta_anonima;
   RAISE EXCEPTION 'FALHOU: leitura direta permitida';
 EXCEPTION WHEN insufficient_privilege THEN RAISE NOTICE 'PASSOU: leitura direta negada'; END;
END; $$;
SELECT bispo_bd.finalizar(1,'ficticio-5','[{"questao_id":1,"opcoes":[2]},{"questao_id":2,"opcoes":[2]}]');
RESET ROLE;
DO $$ BEGIN
 IF (SELECT count(*) FROM bispo_bd.submissao_anonima) <> 4 THEN
   RAISE EXCEPTION 'FALHOU: execução restrita';
 END IF;
 RAISE NOTICE 'PASSOU: função autorizada funciona sem acesso direto';
END; $$;
ROLLBACK;

-- Consultas sobre carga original (antes do ensaio de concorrência).
\ir ../queries.sql

DO $$ BEGIN
 IF (SELECT count(s.id) FROM bispo_bd.pesquisa p LEFT JOIN bispo_bd.submissao_anonima s
     ON s.pesquisa_id=p.id WHERE p.id=1 GROUP BY p.id) <> 2 THEN RAISE EXCEPTION 'FALHOU: Q1'; END IF;
 IF (SELECT count(r.submissao_id) FROM bispo_bd.opcao o LEFT JOIN bispo_bd.resposta_opcao r
     ON r.questao_id=o.questao_id AND r.numero_opcao=o.numero
     WHERE o.questao_id=2 AND o.numero=2 GROUP BY o.questao_id,o.numero) <> 2 THEN RAISE EXCEPTION 'FALHOU: Q2'; END IF;
 IF (SELECT count(DISTINCT s.id) FROM bispo_bd.categoria c
     LEFT JOIN bispo_bd.pesquisa_categoria pc ON pc.categoria_id=c.id
     LEFT JOIN bispo_bd.pesquisa p ON p.id=pc.pesquisa_id
     LEFT JOIN bispo_bd.submissao_anonima s ON s.pesquisa_id=p.id
     WHERE c.id=2 GROUP BY c.id) <> 3 THEN RAISE EXCEPTION 'FALHOU: Q3'; END IF;
 IF (SELECT count(a.id) FILTER (WHERE a.finalizada) FROM bispo_bd.pesquisa p
     LEFT JOIN bispo_bd.participacao a ON a.pesquisa_id=p.id
     WHERE p.id=1 GROUP BY p.id) <> 2 THEN RAISE EXCEPTION 'FALHOU: Q4'; END IF;
 RAISE NOTICE 'PASSOU: contagens esperadas das quatro consultas';
END; $$;
