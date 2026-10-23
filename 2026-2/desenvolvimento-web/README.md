# Desenvolvimento Web

**Professor:** Prof. Anderson Pazin. Entrega de front-end — 23/10/2026.

Protótipo acadêmico integrado a partir de `desenvolvimentoweb.zip`, fornecido pelo usuário. Preserva as 12 páginas, o banner e a identidade visual recebidos; acrescenta JavaScript, validações, navegação por etapas e ajustes de acessibilidade e responsividade.

**Aplicação publicada e verificada:** [GitHub Pages](https://fatec-extensao.github.io/pi-ads-2026-1-bispo/). [Código inicial](./src/index.html).

## Entregas

| Atividade | Evidência |
|---|---|
| Arquitetura e wireframes | [Sitemap e quatro SVG editáveis](./wireframes/sitemap.md) |
| HTML e CSS | [12 páginas semânticas](./src/index.html), [CSS mobile-first](./src/css/style.css), textos alternativos, rótulos e foco visível |
| JavaScript | [Validação e fluxos](./src/js/app.js): obrigatórios, formatos, datas, duplicidade na página, alternativas e seleção de perguntas |
| Navegação de questionário | Quatro etapas, avanço/retorno, preservação temporária das escolhas e confirmação final |
| Publicação | GitHub Pages, com cópia da pasta `src` na branch dedicada `gh-pages` |
| Verificação | [Registro e instruções](./testes/README.md), [resultados automatizados](./testes/evidencias/resultado.json) |

Issues relacionadas: [#6](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/6), [#7](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/7), [#8](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/8), [#9](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/9).

## Executar e testar

Abra `src/index.html` ou sirva `src/` com um servidor estático. Não é necessário compilar o site nem instalar dependências para usá-lo. Para testar: consulte [testes](./testes/README.md).

## Limites da entrega

Os formulários validam e simulam ações no navegador. Não há autenticação real, banco, API, envio ou armazenamento de dados. O código fictício `DEMO-2026` serve apenas para percorrer o questionário. Login com formato válido abre o painel, que também é acessível pela navegação. Geração de códigos e cadastros não têm validade fora da página. Relatórios e monitoramento usam exemplos fictícios fixos, não respostas coletadas.

Credenciais não são enviadas por GET, não aparecem na URL e não são guardadas em localStorage, sessionStorage ou cookies. Sem JavaScript, os formulários ficam desativados. A identidade visual recebida foi preservada; o CSS foi reorganizado para partir das telas menores.

A integração com banco e regras de anonimato exige backend, autorização, transações e revisão de segurança. O formulário aberto e as alternativas do ZIP são demonstrações de interface; não modificam o escopo do modelo de dados de cada projeto. A conclusão técnica desta disciplina não representa conclusão do PI nem aprovação acadêmica.

## Situação da entrega

Adaptação autorizada pelo usuário do mesmo protótipo entregue aos projetos Schiazza e Santos. O conteúdo usa exemplos de questionários; não altera as propostas de requisitos nem o banco do Bispo. A conclusão refere-se apenas ao front-end demonstrativo das issues #6, #7 e #8. A issue #9 foi atendida pela publicação nativa do GitHub Pages e pelos testes no endereço público.

A publicação nativa está configurada na branch gh-pages, a partir do conteúdo de src.

## Publicação verificada — 23/10/2026

A publicação nativa do GitHub Pages pela branch gh-pages funcionou. O endereço público retornou HTTP 200 e passou pela mesma suíte de navegação, formulários e responsividade usada localmente: 12 páginas em 360 e 1280 px, recursos estáticos acessíveis e nenhum erro JavaScript/HTTP nos fluxos testados.

GitHub Actions continua desativado pela organização, e a tentativa de habilitar no repositório retornou HTTP 409. Esse resultado não impediu a publicação nativa que foi efetivamente verificada. Nenhuma política da organização foi alterada.

[Resultados dos testes públicos](./testes/evidencias-publicas/resultado.json) · [Registro de publicação](./testes/evidencias/publicacao.json).
