# Banco de Dados I — entrega acadêmica para revisão

Professor: Luiz Fernando de Oliveira Silva. Repositório: `Fatec-Extensao/pi-ads-2026-1-bispo`.

Esta entrega atende às issues [#3](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/3),
[#4](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/4) e
[#5](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/5), com adaptação
ao escopo documentado no bispo e às propostas de
[Engenharia de Software II](../engenharia-software/requisitos.md).
Não foram copiados scripts ou modelos prontos de outro repositório.

## Artefatos

| Entrega | Arquivos |
| --- | --- |
| #3 — DER e cardinalidades | [Modelo conceitual e fonte editável DOT](./modelo-conceitual.md), [PNG](./modelo-conceitual.png), [SVG editável](./modelo-conceitual.svg) |
| #4 — Modelo lógico, 3FN e DDL | [Mapeamento e normalização](./modelo-logico.md), [schema.sql](./schema.sql) |
| #5 — DML e consultas | [Carga fictícia](./dados-ficticios.sql), [quatro consultas](./queries.sql) |
| Validação | [SQL de testes](./testes/validacao.sql), [executor de concorrência](./testes/executar.py), [evidências reais](./testes/evidencias.md) |

## Escolhas da demonstração

PostgreSQL 18.6, 13 tabelas em schema próprio; um questionário por pesquisa;
categorias N:M; questões fechadas de seleção única/múltipla e obrigatoriedade
configurável; estrutura congelada ao abrir a pesquisa. São propostas acadêmicas
para viabilizar testes, não confirmação do escopo definitivo pelo responsável.

Token individual é guardado por resumo SHA-256 e consumido na finalização.
Participação é única por pesquisa/identidade de elegibilidade. Respostas não
referenciam identidade, participação ou token. Expiração, distribuição, canal de
relatórios e retenção não foram definidos. A separação não garante anonimato absoluto.

## Reprodução em banco descartável

Requer PostgreSQL 18 e Python 3. Execute a partir desta pasta, em banco vazio
reservado a testes; substitua conexão/credenciais locais conforme seu ambiente.
Não execute a carga fictícia em banco com dados reais. O DDL não apaga schemas.

```text
createdb -h 127.0.0.1 -U postgres bispo_teste
psql -h 127.0.0.1 -U postgres -d bispo_teste -X -v ON_ERROR_STOP=1 -f schema.sql
psql -h 127.0.0.1 -U postgres -d bispo_teste -X -v ON_ERROR_STOP=1 -f dados-ficticios.sql
psql -h 127.0.0.1 -U postgres -d bispo_teste -X -v ON_ERROR_STOP=1 -f queries.sql
```

No PowerShell, configure a conexão para o executor:

```powershell
$env:PGHOST = '127.0.0.1'
$env:PGPORT = '5432'
$env:PGUSER = 'postgres'
$env:PGDATABASE = 'bispo_teste'
python testes/executar.py
```

O `psql` precisa estar no PATH, ou informe seu caminho na variável `PSQL`.
O executor exige banco com prefixo `bispo_` e carga original com três submissões;
roda a validação sequencial e duas conexões concorrentes. Sai com erro se uma
assertiva falhar. Produz `sql-validation.txt` e `evidencias-execucao.md` no diretório
de execução; esses arquivos locais não substituem as evidências versionadas.
Ao testar novamente, use outro banco descartável vazio, pois a concorrência
confirma uma quarta submissão. Os demais testes fazem rollback de suas alterações.

## Segurança e limites

O serviço futuro deve receber somente EXECUTE na função de finalização, sem
escrita/leitura direta das tabelas. O teste demonstra esse perfil mínimo.
Gestão e consulta de resultados precisam de autenticação e autorização por
proprietário no futuro backend; isso não foi implementado como aplicação web.
Não usar identificadores reais ou tokens curtos/previsíveis da carga de exemplo.

Os testes SQL não constituem prova de anonimato, desempenho ou conformidade legal.
Conteúdo, logs, acesso privilegiado, WAL/backups e grupos pequenos podem permitir
correlação. Veja as limitações no [modelo lógico](./modelo-logico.md).

Entrega técnica disponível no [PR #13](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/pull/13),
sem merge. As questões abertas de escopo e a validação pelo professor permanecem
explicitadas; o registro de entrega nas issues não substitui essa aprovação.

[Voltar para 2026-2](../README.md)
