# Sistema Web para Gestão de Pesquisas por Questionários

Projeto Integrador II — ADS — FATEC Lins — 2026-2. Material de apresentação em Markdown, adaptado ao repositório Bispo em 6 de novembro de 2026.

## Problema e objetivo

Organizar pesquisas institucionais, questionários, participantes e resultados. O projeto reúne análise de requisitos, modelagem de dados e prototipação de interfaces. A entrega acadêmica demonstra artefatos; não representa serviço de coleta em produção.

## Escopo documentado

- **Engenharia de Software:** requisitos, critérios de aceitação, regras e diagramas UML propostos, disponíveis nesta branch.
- **Banco de Dados:** DER, modelo lógico, DDL, carga fictícia, consultas e evidências SQL, disponíveis nesta branch.
- **Desenvolvimento Web:** protótipo demonstrativo publicado, com HTML, CSS, JavaScript, wireframes e evidências no repositório.
- **Segurança:** análise de riscos e revisão de privacidade nesta branch; decisões institucionais seguem pendentes.

A interface não se conecta ao banco, não possui autenticação real e não persiste respostas. A proposta acadêmica não confirma escopo definitivo pelo professor.

## Requisitos e modelagem

Os atores, requisitos, regras, critérios de aceitação e lacunas constam em [requisitos.md](../engenharia-software/requisitos.md). Os diagramas de casos de uso, classes e sequência, com especificação, estão em [modelagem UML](../engenharia-software/modelagem-uml/especificacao.md). São propostas rastreadas a partir do material disponível, não funcionalidades comprovadamente implantadas.

## Banco de Dados

O [modelo conceitual](../banco-de-dados/modelo-conceitual.md) descreve entidades e cardinalidades; o [modelo lógico](../banco-de-dados/modelo-logico.md) documenta normalização e escolhas da demonstração. O [schema SQL](../banco-de-dados/schema.sql) e [carga fictícia](../banco-de-dados/dados-ficticios.sql) não estão integrados ao front-end. As [evidências](../banco-de-dados/testes/evidencias.md) registram execuções anteriores; não foram reexecutadas durante esta revisão.

## Demonstração Web

Acesse o [protótipo publicado do Bispo](https://fatec-extensao.github.io/pi-ads-2026-1-bispo/). Utilize apenas valores fictícios. O login simula validações no navegador; não implementa autenticação. Formulários não enviam nem armazenam respostas. Relatórios são exemplos fixos.

## Segurança e privacidade

Consulte a [análise de riscos](../seguranca/analise-de-riscos.md) e o [relatório LGPD e anonimato](../seguranca/lgpd-e-anonimato.md). Nenhum dos documentos é pentest ou parecer jurídico. Controlador, canal oficial, finalidade de cada pesquisa, hipótese legal e política de retenção dependem de confirmação institucional. Não se afirma anonimato absoluto ou conformidade legal plena.

## Roteiro sugerido (8–10 minutos)

1. **Problema e objetivo (1 min):** apresente a proposta e o escopo que ainda requer validação acadêmica.
2. **Protótipo (2 min):** percorra páginas com dados fictícios e demonstre a natureza simulada dos fluxos.
3. **Requisitos e UML (1–2 min):** mostre atores, requisitos e diagramas, separando proposta de implementação.
4. **Modelo de dados (1–2 min):** apresente DER, normalização e finalização transacional; esclareça que não existe integração com a interface.
5. **Segurança e privacidade (1–2 min):** discuta acesso indevido, reidentificação, credenciais e decisões ainda sem confirmação.
6. **Próximos passos (1 min):** revisão técnica, validação pelo professor e decisões institucionais antes de qualquer coleta.

## Situação da entrega

Esta apresentação em Markdown atende ao formato documentado para a Issue #12. A revisão e aprovação acadêmica dependem do professor. Nenhum vídeo foi produzido nesta etapa.
