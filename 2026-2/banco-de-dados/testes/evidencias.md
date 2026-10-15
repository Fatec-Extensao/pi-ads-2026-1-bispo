# Evidências de execução — PostgreSQL

Execução local em 15/10/2026, PostgreSQL 18.6, banco descartável `bispo_validacao`,
conexão restrita a 127.0.0.1. Somente dados e credenciais fictícios.

## Validação sequencial

`schema.sql` e `dados-ficticios.sql` foram executados sem erro em banco vazio.
O teste `testes/validacao.sql` passou integralmente com `ON_ERROR_STOP=1`.
Todos os blocos mutáveis da validação sequencial foram revertidos.

```text
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:20: NOTICE:  PASSOU: 13 tabelas criadas
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:21: NOTICE:  PASSOU: carga com 3 submissões
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:22: NOTICE:  PASSOU: 3 participações finalizadas
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:23: NOTICE:  PASSOU: 3 tokens consumidos
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:24: NOTICE:  PASSOU: 6 escolhas fictícias
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:27: NOTICE:  PASSOU: sem coluna de vínculo nominal nas respostas
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:29: NOTICE:  PASSOU: unique
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:30: NOTICE:  PASSOU: foreign key
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:31: NOTICE:  PASSOU: Acesso inválido
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:32: NOTICE:  PASSOU: Acesso inválido
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:33: NOTICE:  PASSOU: já finalizada
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:34: NOTICE:  PASSOU: lista
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:35: NOTICE:  PASSOU: sem respostas
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:36: NOTICE:  PASSOU: Formato
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:37: NOTICE:  PASSOU: Número
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:38: NOTICE:  PASSOU: obrigatória ausente
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:39: NOTICE:  PASSOU: seleção única
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:40: NOTICE:  PASSOU: Opção repetida
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:41: NOTICE:  PASSOU: Questão repetida
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:42: NOTICE:  PASSOU: fora do questionário
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:43: NOTICE:  PASSOU: foreign key
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:44: NOTICE:  PASSOU: falhas não deixam submissões parciais
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:45: NOTICE:  PASSOU: falhas preservam participação
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:46: NOTICE:  PASSOU: falhas preservam token
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:53: NOTICE:  PASSOU: falha induzida
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:56: NOTICE:  PASSOU: rollback após gravação e consumo
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:61: NOTICE:  PASSOU: DELETE de participação pendente executado
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:63: NOTICE:  PASSOU: rascunho
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:64: NOTICE:  PASSOU: rascunho
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:65: NOTICE:  PASSOU: Transição
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:67: NOTICE:  PASSOU: indisponível
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:68: NOTICE:  PASSOU: Transição
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:83: NOTICE:  PASSOU: search_path protegido e seleção múltipla válida
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:101: NOTICE:  PASSOU: escrita direta negada
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:101: NOTICE:  PASSOU: leitura direta negada
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:109: NOTICE:  PASSOU: função autorizada funciona sem acesso direto
psql:C:/Users/Usu�rio/Documents/Codex/2026-10-15/referenced-chatgpt-conversation-this-is-an/work/bispo/2026-2/banco-de-dados/testes/validacao.sql:130: NOTICE:  PASSOU: contagens esperadas das quatro consultas
```

## Consultas — resultados antes da concorrência

- Q1: pesquisa 1 = 2 submissões; pesquisa 2 = 1.
- Q2: questão 1 = [1,1,0]; questão 2 = [1,2,0]; questão 3 = [1,0].
- Q3: categoria 1 = 1 pesquisa / 2 submissões; categoria 2 = 2 pesquisas / 3 submissões.
- Q4: pesquisa 1 = 6 autorizações / 2 finais / 4 pendentes; pesquisa 2 = 1 / 1 / 0.

As contagens das quatro consultas têm assertivas no SQL de validação.

## Concorrência real — duas conexões, tokens diferentes, mesma participação

A abriu transação, finalizou participação 3 e reteve o bloqueio por quatro segundos.
B tentou finalizar a mesma participação com outra credencial individual válida.
O estado `wait_event_type=Lock` da conexão B foi observado em `pg_stat_activity`.
A confirmou; B foi rejeitada após a revalidação. Não houve segunda submissão.

```text
Conexão A: exit 0
BEGIN
 finalizar 
-----------
 t
(1 row)

 pg_sleep 
----------
 
(1 row)

COMMIT
Conexão B: exit 1 (erro esperado)
ERROR:  Participação já finalizada
CONTEXT:  PL/pgSQL function finalizar(bigint,text,jsonb) line 19 at RAISE
Contagens após concorrência: submissões | participações finais | tokens consumidos
4|4|4
```

## Limites

São testes do protótipo SQL, não do backend/web nem prova de anonimato absoluto.
O controle de identidade real, autenticação HTTP, autorização por proprietário,
política de divulgação, retenção e distribuição dos tokens continuam pendentes.
O dono do banco pode correlacionar transações, logs e conteúdo. Em produção,
logs e telemetria não devem registrar a associação entre token e respostas.
