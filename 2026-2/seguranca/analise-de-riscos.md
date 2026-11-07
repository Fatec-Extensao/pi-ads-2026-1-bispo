# Análise de riscos e ameaças Web

**Projeto:** protótipo acadêmico de pesquisas por questionários — FATEC Lins  
**Data:** 6 de novembro de 2026  
**Escopo:** avaliação documental do protótipo estático e das propostas técnicas deste repositório. Não é pentest, auditoria de infraestrutura ou declaração de segurança de produção.

## Contexto

O protótipo publicado demonstra fluxos em HTML, CSS e JavaScript. Login, preenchimentos e relatórios são simulações; a interface não implementa autenticação real, API ou persistência. Os documentos de Engenharia de Software e Banco de Dados desta entrega são propostas acadêmicas e não estão conectados à aplicação.

A probabilidade (P) e o impacto (I) abaixo são avaliações qualitativas preliminares. Reavaliar quando arquitetura, ambiente, dados, público e controles reais forem definidos. As mitigações são recomendações, não controles cuja implantação foi confirmada.

## Escala

P e I: Baixo, Médio ou Alto. Alto/Alto = Crítico; Alto/Médio = Alto; combinações intermediárias = Médio; Baixo/Baixo = Baixo. Não há dados operacionais para estimativas quantitativas.

## Matriz

| ID | Ameaça e ativo | P | I | Nível | Mitigação recomendada | Situação verificada |
|---|---|---:|---:|---|---|---|
| R1 | Injeção SQL em entradas e filtros; banco/respostas | Média | Alto | Alto | Consultas parametrizadas, validação no servidor, privilégio mínimo e testes autorizados | Backend não integrado; segurança de produção não avaliada |
| R2 | Acesso indevido a respostas, relatórios ou exportações | Média | Alto | Alto | Autorização por recurso no servidor, controle de exportação, agregação e supressão de grupos pequenos | Relatórios atuais são fictícios; autorização real não demonstrada |
| R3 | Reidentificação via horários, logs, conteúdo livre ou grupos pequenos | Média | Alto | Alto | Minimização, redução de precisão temporal, separação de dados, controle de logs e revisão de agregados | Anonimato absoluto não presumido |
| R4 | Fraude, repetição ou respostas automatizadas | Média | Médio | Médio | Elegibilidade validada no servidor, autorização de uso único e limitação de taxa | Elegibilidade e mitigação de bots não implementadas |
| R5 | Roubo/reutilização de tokens ou credenciais | Média | Alto | Alto | Segredos aleatórios, armazenamento protegido, uso único, validade/revogação decididas e não registrar segredos | Modelo SQL é proposta; emissão e operação não existem na interface |
| R6 | XSS por conteúdo de perguntas, respostas ou relatórios | Média | Alto | Alto | Escape contextual, evitar HTML arbitrário, CSP e testes com entradas maliciosas | Backend não existe; controles não avaliados |
| R7 | CSRF ou abuso de sessão administrativa | Baixa | Alto | Médio | Proteção CSRF, cookies Secure/HttpOnly/SameSite e autorização no servidor | Protótipo não tem sessão real |
| R8 | Indisponibilidade ou consumo excessivo | Média | Médio | Médio | Limites, monitoramento, proteção de infraestrutura, backups e plano de recuperação | Ambiente e metas não definidos |
| R9 | Vazamento por configuração, backup ou segredo exposto | Baixa | Alto | Médio | Segredos fora do código, permissões revisadas, backups protegidos e restauração testada | Infraestrutura não avaliada |
| R10 | Coleta sem finalidade, transparência ou hipótese legal definida | Média | Alto | Alto | Aprovação institucional, inventário, análise da hipótese aplicável, aviso claro e minimização | Decisões institucionais não constam no repositório |

## Tratamento e prioridades

Antes de coleta real, priorizar R2, R3, R5 e R10: definir responsável e finalidade, autorização para resultados, fluxo de elegibilidade/resposta, aviso e retenção. Antes de disponibilizar backend, revisar também R1, R6, R7, R8 e R9 em ambiente autorizado. A aceitação do risco residual cabe ao responsável após avaliação documentada.

## Pendências

- Controlador, operador, encarregado e canal oficial: **pendentes de confirmação institucional**.
- Público, finalidade, categorias e eventual dado sensível: **dependem de cada pesquisa**.
- Hospedagem, integrações, autenticação e produção: **não confirmadas**.
- Hipótese legal, retenção, compartilhamento e resposta a incidentes: **dependem de validação institucional**.
- Nenhum pentest ou teste de backend foi realizado nesta análise.

## Referências

- OWASP Foundation. [OWASP Top 10](https://owasp.org/www-project-top-ten/).
- Brasil. [Lei nº 13.709/2018 — LGPD](https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm).
- [README de Desenvolvimento Web](../desenvolvimento-web/README.md) · [README de Banco de Dados](../banco-de-dados/README.md) · [LGPD e anonimato](./lgpd-e-anonimato.md).

[Voltar para Segurança](./README.md)
