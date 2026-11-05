# LGPD e Anonimato na Plataforma de Pesquisas por Questionários

## 1. Objetivo

Este documento apresenta uma proposta de adequação à Lei Geral de Proteção de Dados Pessoais (LGPD — Lei nº 13.709/2018) para a plataforma de pesquisas por questionários desenvolvida no Projeto Integrador.

O objetivo é identificar os dados pessoais que podem ser tratados, estabelecer medidas para proteger as informações dos participantes e apresentar mecanismos para reduzir a possibilidade de identificação dos respondentes.

Este documento possui finalidade acadêmica e apresenta recomendações. A conformidade legal definitiva depende da implementação das medidas e da avaliação dos responsáveis pelo tratamento dos dados.

## 2. Identificação dos dados pessoais

A plataforma poderá tratar diferentes tipos de informações durante a utilização dos questionários.

| Tipo de informação | Exemplo | Cuidados necessários |
|---|---|---|
| Dados de identificação | Nome, e-mail e identificador do usuário | Coletar somente quando necessário |
| Dados de participação | Registro de participação em pesquisas | Restringir o acesso |
| Respostas | Alternativas selecionadas e textos enviados | Evitar associação direta com o participante |
| Dados técnicos | Endereço IP e registros de acesso | Limitar armazenamento e acesso |
| Dados sensíveis | Informações sobre saúde ou outros dados previstos no Art. 5º, II, da LGPD | Exigir proteção e fundamento legal específico |

A plataforma deve evitar a coleta de informações desnecessárias para a finalidade da pesquisa.

## 3. Bases legais para o tratamento

O tratamento de dados pessoais deverá possuir uma base legal adequada, conforme o Art. 7º da LGPD.

As principais possibilidades que deverão ser avaliadas são:

- Consentimento do titular, quando aplicável.
- Cumprimento de obrigação legal ou regulatória.
- Realização de estudos por órgão de pesquisa, quando os requisitos legais forem atendidos.
- Execução de contrato ou procedimentos preliminares relacionados a contrato.
- Legítimo interesse, quando aplicável e após avaliação dos requisitos legais.

Para dados pessoais sensíveis, devem ser observadas as hipóteses específicas do Art. 11 da LGPD.

A escolha da base legal deverá ser feita pelos responsáveis pelo tratamento, considerando a finalidade real da pesquisa. O consentimento não deve ser utilizado automaticamente como justificativa para qualquer tratamento.

## 4. Medidas para garantir o anonimato

Para reduzir a possibilidade de identificação dos participantes, recomenda-se implementar as seguintes medidas:

1. Separar os dados de identificação dos participantes das respostas dos questionários.
2. Utilizar identificadores aleatórios para registrar respostas.
3. Evitar armazenar nomes e e-mails junto às respostas.
4. Restringir o acesso às informações pessoais.
5. Apresentar resultados agrupados, evitando a divulgação de respostas que permitam identificar indivíduos.
6. Remover informações pessoais desnecessárias dos textos enviados pelos participantes.

Também é possível utilizar técnicas de pseudonimização, como identificadores aleatórios e resumos criptográficos de tokens.

É importante destacar que pseudonimização não significa anonimização. Se existir possibilidade razoável de relacionar os dados novamente a uma pessoa, eles continuam sujeitos à LGPD.

## 5. Política de armazenamento e retenção

A plataforma deverá possuir regras claras para armazenamento e exclusão dos dados.

Como proposta inicial para o projeto:

| Informação | Período proposto | Medida |
|---|---|---|
| Dados de participação | Até o encerramento da pesquisa e revisão posterior | Excluir quando não forem mais necessários |
| Respostas | Até a conclusão da análise | Anonimizar ou excluir quando possível |
| Registros técnicos | Até 90 dias, como proposta inicial | Excluir após o período definido |
| Cópias de segurança | Até 30 dias, como proposta inicial | Substituir ou eliminar conforme política de backup |

Os períodos apresentados são sugestões para o projeto acadêmico, não prazos legais universais. Devem ser aprovados pelos responsáveis e ajustados às finalidades e obrigações aplicáveis.

## 6. Medidas de segurança da informação

Para proteger os dados pessoais, recomenda-se:

- Utilizar controle de acesso por usuário e perfil.
- Exigir autenticação para funcionalidades administrativas.
- Utilizar conexão segura HTTPS.
- Restringir permissões no banco de dados.
- Evitar armazenar senhas em texto puro.
- Registrar operações importantes para auditoria, sem incluir dados pessoais desnecessários.
- Manter cópias de segurança protegidas.
- Definir procedimentos para identificação e resposta a incidentes de segurança.

O acesso aos dados deve ser limitado às pessoas que realmente precisam utilizá-los.

## 7. Direitos dos titulares

A plataforma deverá considerar os direitos previstos no Art. 18 da LGPD.

Entre eles estão:

- Confirmação da existência de tratamento.
- Acesso aos dados pessoais.
- Correção de dados incompletos ou desatualizados.
- Anonimização, bloqueio ou eliminação de dados desnecessários ou tratados em desconformidade.
- Informação sobre compartilhamento de dados.
- Revogação do consentimento, quando essa for a base legal utilizada.

Deverá existir um canal de comunicação para que os participantes possam exercer seus direitos.

## 8. Aviso de privacidade proposto

A plataforma deverá apresentar um aviso de privacidade informando:

- Quais dados são coletados.
- Para qual finalidade os dados são utilizados.
- Quem é o responsável pelo tratamento.
- Por quanto tempo os dados serão armazenados.
- Se haverá compartilhamento de informações.
- Como os participantes poderão exercer seus direitos.

O aviso deverá ser preenchido com os dados reais dos responsáveis pelo projeto antes de qualquer utilização com participantes reais.

## 9. Situação atual do projeto

O projeto possui uma estrutura acadêmica de plataforma de pesquisas por questionários, com interfaces desenvolvidas em HTML, CSS e JavaScript e uma modelagem de banco de dados.

O protótipo de interface possui caráter demonstrativo. As simulações não representam um sistema completo de autenticação, armazenamento ou tratamento de respostas reais.

Portanto, as medidas descritas neste documento representam recomendações para a implementação e evolução do sistema. Não é possível afirmar que a plataforma já possui conformidade integral com a LGPD ou que garante anonimato absoluto.

## 10. Plano de implementação

Para evoluir o projeto, recomenda-se:

1. Definir formalmente os responsáveis pelo tratamento dos dados.
2. Identificar todas as informações necessárias para cada pesquisa.
3. Definir a base legal adequada para cada finalidade.
4. Implementar mecanismos de separação entre identificação e respostas.
5. Configurar autenticação e controle de permissões.
6. Estabelecer prazos de retenção e exclusão.
7. Criar um aviso de privacidade acessível aos participantes.
8. Testar os mecanismos de proteção antes de utilizar dados reais.

## 11. Referências

- BRASIL. Lei nº 13.709, de 14 de agosto de 2018. Lei Geral de Proteção de Dados Pessoais (LGPD). Disponível em: https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm.
- AUTORIDADE NACIONAL DE PROTEÇÃO DE DADOS (ANPD). Guia orientativo sobre segurança da informação para agentes de tratamento de pequeno porte. Disponível em: https://www.gov.br/anpd/pt-br/centrais-de-conteudo/materiais-educativos-e-publicacoes/guia_seguranca_da_informacao_para_agentes_de_tratamento_de_pequeno_porte.
- Repositório do Projeto Integrador: Fatec-Extensao/pi-ads-2026-1-bispo.

---

**Documento elaborado para a atividade de Segurança da Informação — LGPD e Anonimato.**
