# Verificação documental — Engenharia de Software II

Data: 15/10/2026. Repositório inspecionado: `Fatec-Extensao/pi-ads-2026-1-bispo`.
Base da proposta: `eda7f823f5cad6f078b94421aa4a01ecf4afcb1a`.

## Evidências consultadas

- README principal, árvore recursiva completa e documentos existentes em 2026-1/2026-2.
- Lista completa das 12 issues, incluindo estado e corpo/checklists; todas abertas,
  sem comentários e sem itens concluídos na inspeção.
- Issues #1/#2 como referência das entregas de Engenharia de Software II; #3/#5,
  #6–#8 e #10/#11 como contexto para entidades, interface, resultados e segurança.
- Requisitos e especificação UML anteriores eram placeholders. O escopo detalhado
  não estava validado; esse limite foi preservado e explicitado na proposta.

## Verificações executadas

| Verificação | Resultado |
| --- | --- |
| Fontes e rastreabilidade | Requisitos documentados separados de propostas; referências às issues corretas do bispo. |
| Links locais dos documentos alterados | Destinos de documentos e imagens conferidos. |
| SVGs | XML válido; três imagens rasterizadas para inspeção visual, com títulos e descrições acessíveis. |
| Legibilidade | Casos de uso, classes e sequência revisados visualmente após rasterização; textos, cardinalidades e conectores legíveis. |
| Coerência | Papéis e casos de uso consistentes com RF; classes cobrem Pesquisa, Questão, Resposta e Categoria; sequência cobre preenchimento e finalização. |
| Unicidade | Regra por identidade/pesquisa e bloqueio na finalização explicitados; token isolado não garante pessoa única. |
| Anonimato | Sem associação nominal com respostas; correlação por logs, tempo, conteúdo e acesso privilegiado explicitamente reconhecida. |
| Transação | Mesma conexão; commit após gravação de respostas e consumo da autorização; rollback e concorrência descritos. |
| Formatos e escopo do diff | Markdown/SVG em Engenharia de Software II; BD foi acrescentado em entrega própria, com links de alinhamento. Sem aplicação ou histórico 2026-1 alterados. |
| Publicação | Branch separada e PR para revisão, sem merge. Checklists/etiquetas podem registrar a entrega técnica, sem afirmar aprovação acadêmica. |

## Limitações

Não foram executados testes de backend HTTP ou desempenho. O protótipo SQL
adicionado posteriormente foi testado no PostgreSQL 18.6, com falha, rollback e
concorrência; veja [evidências de BD](../banco-de-dados/testes/evidencias.md).
Esses testes não constituem validação da aplicação completa nem anonimato absoluto.

Não houve entrevista com o colega ou validação pelo professor. Contexto
institucional, identidade de elegibilidade, autenticação, multiplicidades,
tipos de questão, ciclo de vida, tokens, relatórios e políticas de privacidade
permanecem sujeitos às decisões listadas em [requisitos.md](./requisitos.md).
Nenhuma expiração de token, canal de entrega ou prazo de retenção foi inventado.

[Voltar para Engenharia de Software II](./README.md)
