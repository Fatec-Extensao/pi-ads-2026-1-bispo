-- Dados exclusivamente fictícios. Executar uma vez após schema.sql em banco de teste.
BEGIN;
INSERT INTO bispo_bd.usuario(id, identificador) VALUES
 (1, 'gestor-ficticio'), (2, 'elegivel-a'), (3, 'elegivel-b'),
 (4, 'elegivel-c'), (5, 'elegivel-d'), (6, 'elegivel-e'), (7, 'elegivel-f');
INSERT INTO bispo_bd.usuario_papel VALUES (1, 'administrador'), (1, 'proprietario'),
 (2, 'respondente'), (3, 'respondente'), (4, 'respondente'),
 (5, 'respondente'), (6, 'respondente'), (7, 'respondente');
INSERT INTO bispo_bd.categoria(id,nome) VALUES (1,'Experiência acadêmica'), (2,'Serviços');
INSERT INTO bispo_bd.pesquisa(id,proprietario_id,titulo) VALUES
 (1,1,'Pesquisa demonstrativa de experiência'), (2,1,'Pesquisa demonstrativa de serviços');
INSERT INTO bispo_bd.pesquisa_categoria VALUES (1,1), (1,2), (2,2);
INSERT INTO bispo_bd.questionario(id,pesquisa_id) VALUES (1,1), (2,2);
INSERT INTO bispo_bd.questao(id,questionario_id,enunciado,ordem,tipo,obrigatoria) VALUES
 (1,1,'Como avalia a experiência?',1,'unica',true),
 (2,1,'Quais recursos utilizou?',2,'multipla',true),
 (3,2,'Como avalia o serviço?',1,'unica',true);
INSERT INTO bispo_bd.opcao VALUES
 (1,1,'Boa'), (1,2,'Regular'), (1,3,'Ruim'),
 (2,1,'Biblioteca'), (2,2,'Laboratório'), (2,3,'Monitoria'),
 (3,1,'Bom'), (3,2,'Regular');
INSERT INTO bispo_bd.participacao(id,pesquisa_id,identidade_id) VALUES
 (1,1,2),(2,1,3),(3,1,4),(4,1,5),(5,1,6),(6,1,7),(7,2,2);
-- Credenciais previsíveis apenas para testes; produção exige aleatoriedade forte.
INSERT INTO bispo_bd.token_individual(participacao_id,resumo_sha256)
 SELECT id, encode(sha256(convert_to('ficticio-' || id, 'UTF8')), 'hex')
 FROM bispo_bd.participacao;
UPDATE bispo_bd.pesquisa SET estado = 'aberta' WHERE id IN (1,2);
-- Resposta exemplo A e B, sempre pela função transacional.
SELECT bispo_bd.finalizar(1,'ficticio-1',
 '[{"questao_id":1,"opcoes":[1]},{"questao_id":2,"opcoes":[1,2]}]');
SELECT bispo_bd.finalizar(1,'ficticio-2',
 '[{"questao_id":1,"opcoes":[2]},{"questao_id":2,"opcoes":[2]}]');
SELECT bispo_bd.finalizar(2,'ficticio-7','[{"questao_id":3,"opcoes":[1]}]');
-- Sincroniza geradores após IDs explícitos, sem antecipar IDs na aplicação.
SELECT setval(pg_get_serial_sequence('bispo_bd.usuario','id'), (SELECT max(id) FROM bispo_bd.usuario));
SELECT setval(pg_get_serial_sequence('bispo_bd.categoria','id'), (SELECT max(id) FROM bispo_bd.categoria));
SELECT setval(pg_get_serial_sequence('bispo_bd.pesquisa','id'), (SELECT max(id) FROM bispo_bd.pesquisa));
SELECT setval(pg_get_serial_sequence('bispo_bd.questionario','id'), (SELECT max(id) FROM bispo_bd.questionario));
SELECT setval(pg_get_serial_sequence('bispo_bd.questao','id'), (SELECT max(id) FROM bispo_bd.questao));
SELECT setval(pg_get_serial_sequence('bispo_bd.participacao','id'), (SELECT max(id) FROM bispo_bd.participacao));
COMMIT;
