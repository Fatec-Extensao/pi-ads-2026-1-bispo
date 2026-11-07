# Plano de Entregas — Atividade 06

Este documento registra as atividades acadêmicas do Projeto Integrador II para
o semestre 2026-2. Cada atividade é acompanhada por uma Issue no GitHub, com
checklist, labels de classificação e vínculo ao Milestone da entrega final.

O cadastro das atividades não representa sua conclusão. Desenvolvimento Web foi integrado e verificado em 23/10/2026. Os artefatos de Engenharia de Software e Banco de Dados estão preparados nesta branch para revisão. Entrega técnica, integração em `main` e aprovação acadêmica são etapas distintas.

## Disciplinas e professores

| Disciplina | Professor |
| --- | --- |
| Engenharia de Software II | Rafael Hamamura |
| Banco de Dados I | Luiz Fernando de Oliveira Silva |
| Desenvolvimento Web | Anderson Pazin |
| Compliance e Segurança da Informação | Alciano Gustavo Genovez de Oliveira |

## Atividades

| Nº | Disciplina | Issue | Título | Caminho previsto da entrega | Situação |
| --- | --- | --- | --- | --- | --- |
| 1 | Engenharia de Software II | [#1](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/1) | `[Eng. Software] Levantamento de Requisitos e Diagrama de Casos de Uso` | [requisitos.md](./engenharia-software/requisitos.md) | Artefato técnico preparado; validação acadêmica pendente |
| 2 | Engenharia de Software II | [#2](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/2) | `[Eng. Software] Modelagem UML - Diagrama de Classes e Sequência` | [modelagem-uml](./engenharia-software/modelagem-uml/) | Artefato técnico preparado; validação acadêmica pendente |
| 3 | Banco de Dados I | [#3](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/3) | `[Banco de Dados] Modelagem Conceitual - Diagrama Entidade-Relacionamento (DER)` | [modelo-conceitual.md](./banco-de-dados/modelo-conceitual.md) | Artefato técnico preparado; validação acadêmica pendente |
| 4 | Banco de Dados I | [#4](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/4) | `[Banco de Dados] Modelagem Lógica e Script DDL de Criação` | [schema.sql](./banco-de-dados/schema.sql) | Artefato técnico preparado; validação acadêmica pendente |
| 5 | Banco de Dados I | [#5](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/5) | `[Banco de Dados] Scripts DML de Povoamento e Consultas Analíticas` | [queries.sql](./banco-de-dados/queries.sql) | Artefato técnico preparado; validação acadêmica pendente |
| 6 | Desenvolvimento Web | [#6](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/6) | `[Dev Web] Arquitetura da Informação e Wireframes das Telas` | [wireframes](./desenvolvimento-web/wireframes/) | Concluída em 23/10/2026 |
| 7 | Desenvolvimento Web | [#7](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/7) | `[Dev Web] Estruturação Semântica HTML e Estilização CSS` | [src](./desenvolvimento-web/src/) | Concluída em 23/10/2026 |
| 8 | Desenvolvimento Web | [#8](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/8) | `[Dev Web] Interatividade Front-End e Validação de Formulários` | `2026-2/desenvolvimento-web/src/js/` | Concluída em 23/10/2026 |
| 9 | Desenvolvimento Web | [#9](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/9) | `[Dev Web] Publicação da Aplicação (GitHub Pages ou Vercel)` | [README principal](../README.md) | Concluída em 23/10/2026 |
| 10 | Compliance e Segurança da Informação | [#10](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/10) | `[Segurança] Análise de Riscos Básica e Ameaças Web` | [analise-de-riscos.md](./seguranca/analise-de-riscos.md) | Artefato preparado nesta branch; revisão pendente |
| 11 | Compliance e Segurança da Informação | [#11](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/11) | `[Segurança] Relatório de Adequação à LGPD e Mecanismos de Anonimato` | [lgpd-e-anonimato.md](./seguranca/lgpd-e-anonimato.md) | Documento revisado; confirmações institucionais pendentes |
| 12 | Projeto Integrador II | [#12](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/12) | `[PI II] Validação do Projeto, Documentação Final e Mídia de Apresentação` | [apresentacao.md](./entrega-final/apresentacao.md) | Material Markdown preparado; validação acadêmica pendente |

A coluna de situação distingue artefato preparado, verificação técnica, publicação e aprovação acadêmica. O PR #13 original estava divergente; esta branch reúne seu conteúdo sobre a `main` atual para revisão.

## Labels e Milestone

As labels com prefixo `disciplina:` identificam a área acadêmica responsável.
As labels `tipo: documentacao` e `tipo: codigo` distinguem documentação Markdown
de implementações, scripts e código-fonte. Uma Issue pode receber uma label de
disciplina e uma label de tipo; a atividade final do Projeto Integrador utiliza
somente a label de documentação.

As 12 Issues estão vinculadas ao Milestone
[Entrega Final 2026-2](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/milestone/1),
criado sem data de vencimento porque o prazo oficial não foi informado.

## Acompanhamento

### Pendentes

- Aprovação acadêmica e confirmação de escopo permanecem pendentes.
- A coleta real depende de decisões institucionais sobre controlador, canal oficial, finalidade, hipótese legal, dados, compartilhamento e retenção.
- Os checklists devem ser atualizados nas respectivas Issues somente após a
  produção e a verificação dos artefatos reais.

### Concluídas

Desenvolvimento Web: issues #6–#9, com artefatos integrados no PR #14 e protótipo publicado. A conclusão técnica não representa aprovação acadêmica nem entrega de backend.

Engenharia de Software e Banco de Dados: artefatos técnicos revisados e trazidos do PR #13 nesta branch. Testes SQL descritos em evidências versionadas; a execução não foi repetida nesta revisão. A interface continua sem integração com banco/backend.

Segurança e apresentação: documentos Markdown desta branch; riscos classificados qualitativamente. Não constituem pentest, parecer jurídico nem declaração de conformidade.

## Regras de publicação

Documentos acadêmicos devem ser escritos em Markdown. Não devem ser publicados
arquivos `.docx`, `.xlsx`, `.pptx` ou `.pdf`. A apresentação final deve utilizar
Markdown, vídeo em formato permitido ou link público para uma apresentação
externa.

[Voltar para 2026-2](./README.md)
