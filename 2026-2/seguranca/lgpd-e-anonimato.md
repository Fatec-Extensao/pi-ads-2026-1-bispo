# LGPD e Anonimato na Plataforma de Pesquisas por Questionários

## 1. Objetivo

Este documento apresenta uma proposta de adequação à Lei Geral de Proteção de Dados Pessoais (LGPD — Lei nº 13.709/2018) para a plataforma de pesquisas por questionários desenvolvida no Projeto Integrador.

O objetivo é identificar os dados pessoais que podem ser tratados, definir medidas de minimização e segurança, estabelecer regras de retenção e reduzir o risco de identificação dos respondentes.

Este documento possui finalidade acadêmica e apresenta recomendações. A conformidade legal definitiva depende da implementação das medidas e da avaliação dos responsáveis pelo tratamento dos dados.

## 2. Identificação e minimização dos dados pessoais

Antes de publicar um questionário, os responsáveis devem registrar quais dados serão tratados, para qual finalidade, por quanto tempo serão mantidos, quem terá acesso e qual base legal será utilizada. Apenas dados necessários para a finalidade informada devem ser coletados.

A plataforma poderá tratar os seguintes tipos de informação:

| Tipo de informação | Exemplo | Cuidados necessários |
|---|---|---|
| Dados de identificação | Nome, e-mail, matrícula ou identificador de usuário | Coletar apenas quando indispensáveis; não os vincular às respostas sem necessidade |
| Dados de contato | E-mail ou telefone para convite e retorno ao participante | Manter separados das respostas e eliminar ao fim da finalidade de contato |
| Dados de participação | Registro de convite, aceite ou participação em pesquisas | Restringir o acesso e registrar apenas o mínimo necessário |
| Respostas | Alternativas selecionadas e textos enviados | Evitar associação direta com o participante e orientar contra a inclusão de dados identificáveis em campos abertos |
| Dados técnicos | Endereço IP e registros de acesso | Limitar coleta, acesso e retenção; não os combinar com respostas quando isso não for necessário |
| Dados sensíveis | Informações sobre origem racial ou étnica, saúde, religião, opinião política, vida sexual, genética ou biometria | Coletar somente se indispensáveis, com salvaguardas reforçadas e hipótese legal específica |

Em pesquisas que não exijam identificação, a plataforma deve evitar solicitar nome, e-mail, matrícula ou outro identificador direto. Também deve evitar perguntas excessivamente detalhadas que, combinadas, possam identificar uma pessoa.

## 3. Bases legais para o tratamento

O tratamento de dados pessoais deverá possuir uma base legal adequada, conforme o Art. 7º da LGPD.

As principais possibilidades que deverão ser avaliadas são:

- Consentimento do titular, quando aplicável.
- Cumprimento de obrigação legal ou regulatória.
- Realização de estudos por órgão de pesquisa, quando os requisitos legais forem atendidos.
- Execução de contrato ou procedimentos preliminares relacionados a contrato.
- Legítimo interesse, quando aplicável e após avaliação dos requisitos legais.

Para dados pessoais sensíveis, devem ser observadas as hipóteses específicas do Art. 11 da LGPD. A condição de projeto acadêmico, por si só, não dispensa a análise da base legal, da necessidade dos dados e das salvaguardas aplicáveis.

A escolha da base legal deverá ser feita pelos responsáveis pelo tratamento, considerando a finalidade real da pesquisa. O consentimento não deve ser utilizado automaticamente como justificativa para qualquer tratamento.

Quando o consentimento for a base legal escolhida, ele deve ser solicitado de forma destacada e separado do aviso de privacidade. O participante deve poder recusar ou revogar o consentimento pelos canais informados, observadas as hipóteses legais de conservação dos dados.

## 4. Medidas para garantir o anonimato

Para reduzir a possibilidade de identificação dos participantes, recomenda-se implementar as seguintes medidas:

1. Separar os dados de identificação dos participantes das respostas dos questionários.
2. Utilizar identificadores aleatórios para registrar respostas.
3. Manter eventual tabela de correspondência entre identificadores e participantes em ambiente separado, com acesso restrito.
4. Evitar armazenar nome, e-mail ou matrícula junto às respostas quando isso não for necessário.
5. Restringir o acesso aos dados pessoais aos integrantes que realmente precisem utilizá-los.
6. Remover ou generalizar informações identificáveis presentes em respostas abertas antes da análise e divulgação.
7. Divulgar resultados apenas de forma agregada e evitar recortes de grupos pequenos que permitam inferir a identidade de uma pessoa.
8. Revisar periodicamente o risco de reidentificação, especialmente quando novos conjuntos de dados forem combinados.

A pseudonimização reduz o risco, mas não transforma dados pessoais em dados anônimos: se houver meios razoáveis para relacionar novamente a informação a uma pessoa, a LGPD continua aplicável. A anonimização somente deve ser declarada quando a identificação não for razoavelmente possível com os meios técnicos disponíveis no momento do tratamento.

## 5. Política de armazenamento e retenção

A plataforma deverá possuir regras claras para armazenamento e exclusão dos dados.

Como proposta inicial para o projeto:

| Informação | Período proposto | Medida |
|---|---|---|
| Dados de contato e participação | Até o encerramento da pesquisa e das comunicações necessárias | Excluir, salvo necessidade legal ou outra justificativa documentada |
| Respostas identificáveis | Até a conclusão da análise e do prazo definido no aviso de privacidade | Anonimizar ou excluir, conforme a finalidade e a viabilidade técnica |
| Registros técnicos | Até 90 dias, como proposta inicial | Excluir após o período definido |
| Cópias de segurança | Até 30 dias, como proposta inicial | Substituir ou eliminar conforme política de backup |

Os períodos apresentados são sugestões para o projeto acadêmico, não prazos legais universais. Devem ser aprovados pelos responsáveis e ajustados às finalidades e obrigações aplicáveis.

A eliminação deve abranger os ambientes de produção e, conforme o ciclo de backup, as cópias de segurança. Se algum dado precisar ser conservado por obrigação legal, defesa de direitos ou outra hipótese aplicável, a justificativa, o prazo e o acesso autorizado devem ser documentados.

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
- Capacitar os integrantes do projeto quanto ao acesso mínimo necessário e ao tratamento responsável dos dados.

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
- Informação sobre decisões tomadas unicamente com base em tratamento automatizado que afetem os interesses do titular, quando houver.

Deverá existir um canal de comunicação para que os participantes possam exercer seus direitos. As solicitações devem ser direcionadas inicialmente ao controlador responsável pela pesquisa. O atendimento deve confirmar a identidade do solicitante de modo proporcional, para não expor dados a terceiros.

## 8. Aviso de privacidade para participantes

O aviso de privacidade deve ser apresentado de forma clara, acessível e antes do envio das respostas. O modelo a seguir deve ser preenchido e revisado pelos responsáveis antes de qualquer uso com participantes reais.

### Modelo de aviso de privacidade

**Aviso de Privacidade — [nome da pesquisa]**

Este aviso explica como os seus dados pessoais serão tratados durante a sua participação na pesquisa **[nome da pesquisa]**.

**1. Controlador e contato**

O responsável pelo tratamento dos dados é **[nome da instituição ou responsável]**, inscrito no **[CNPJ, se aplicável]**.

Para dúvidas ou solicitações sobre seus dados pessoais, entre em contato por **[e-mail ou canal oficial]**.

**2. Finalidade da pesquisa**

Os dados serão utilizados exclusivamente para **[descrever a finalidade específica da pesquisa e a forma de uso dos resultados]**.

**3. Dados coletados**

Poderão ser coletados os seguintes dados: **[listar somente as categorias de dados efetivamente necessárias]**.

Não informe dados pessoais de terceiros ou informações que não sejam solicitadas. Caso a pesquisa não exija identificação, não serão solicitados nome, e-mail, matrícula ou outro identificador direto nas respostas.

**4. Base legal**

O tratamento será realizado com base em **[informar a hipótese legal aplicável, conforme os Arts. 7º ou 11 da LGPD]**.

Quando a base legal for o consentimento, ele será solicitado separadamente. A leitura deste aviso, por si só, não substitui o consentimento.

**5. Compartilhamento e operadores**

Os dados **[não serão compartilhados com terceiros / poderão ser compartilhados com: identificar destinatários, finalidade e salvaguardas]**.

Quando houver prestadores que tratem dados em nome do responsável, eles atuarão somente para as finalidades informadas e com controles compatíveis de segurança.

**6. Armazenamento e segurança**

Os dados serão mantidos até **[informar data ou critério objetivo de retenção]** e, depois, serão excluídos ou anonimizados, quando aplicável e permitido pela legislação.

A pesquisa adotará medidas de segurança e acesso restrito para reduzir o risco de uso indevido. Respostas e dados de identificação serão mantidos separados sempre que isso for compatível com a finalidade da pesquisa.

**7. Participação e consequências da recusa**

A participação é **[voluntária / obrigatória, com justificativa aplicável]**. Você poderá deixar de responder a perguntas opcionais ou interromper a participação, observadas as condições informadas em **[descrever eventual consequência real da recusa ou retirada]**.

**8. Seus direitos**

Você pode solicitar confirmação do tratamento, acesso, correção, anonimização, bloqueio, eliminação, informação sobre compartilhamentos e revogação do consentimento, quando aplicável, pelo canal informado neste aviso.

Caso entenda que seus direitos não foram atendidos, poderá buscar os canais competentes, inclusive a Autoridade Nacional de Proteção de Dados (ANPD), conforme a legislação aplicável.

**9. Decisões automatizadas e transferências internacionais**

**[Informar se há ou não decisões tomadas exclusivamente de forma automatizada que afetem o participante.]**

**[Informar se há ou não transferência internacional de dados; se houver, indicar os países ou fornecedores envolvidos e as salvaguardas aplicáveis.]**

**10. Atualizações deste aviso**

Este aviso poderá ser atualizado quando houver alteração relevante no tratamento de dados. A versão aplicável à pesquisa será identificada por **[data e versão]**.

Antes da coleta, os campos entre colchetes devem ser preenchidos com informações verdadeiras e específicas da pesquisa. O aviso deve ficar disponível aos participantes durante todo o período de tratamento.

## 9. Situação atual do projeto

O projeto possui uma estrutura acadêmica de plataforma de pesquisas por questionários, com interfaces desenvolvidas em HTML, CSS e JavaScript e uma modelagem de banco de dados.

O protótipo de interface possui caráter demonstrativo. As simulações não representam um sistema completo de autenticação, armazenamento ou tratamento de respostas reais.

Portanto, as medidas descritas neste documento representam recomendações para a implementação e evolução do sistema. Não é possível afirmar que a plataforma já possui conformidade integral com a LGPD ou que garante anonimato absoluto.

## 10. Plano de implementação

Para evoluir o projeto, recomenda-se:

1. Definir formalmente o controlador, os operadores e os canais de contato relacionados a cada pesquisa.
2. Manter um inventário dos dados, finalidades, bases legais, acessos, compartilhamentos e prazos de retenção.
3. Identificar as informações estritamente necessárias para cada questionário.
4. Implementar mecanismos de separação entre identificação e respostas.
5. Configurar autenticação e controle de permissões.
6. Estabelecer rotinas de retenção, anonimização e eliminação, inclusive para backups.
7. Publicar o aviso de privacidade preenchido antes da coleta.
8. Testar os mecanismos de proteção e o atendimento aos direitos dos titulares antes de utilizar dados reais.
9. Reavaliar os controles quando houver mudança de finalidade, público, categorias de dados ou fornecedores.

## 11. Referências

- BRASIL. Lei nº 13.709, de 14 de agosto de 2018. Lei Geral de Proteção de Dados Pessoais (LGPD). Disponível em: https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm.
- AUTORIDADE NACIONAL DE PROTEÇÃO DE DADOS (ANPD). Direito dos Titulares. Disponível em: https://www.gov.br/anpd/pt-br/assuntos/titular-de-dados-1/direito-dos-titulares.
- GOVERNO DIGITAL. Guia de Boas Práticas — Lei Geral de Proteção de Dados. Disponível em: https://www.gov.br/governodigital/pt-br/privacidade-e-seguranca/guias/guia_lgpd.pdf.
- AUTORIDADE NACIONAL DE PROTEÇÃO DE DADOS (ANPD). Guia orientativo: tratamento de dados pessoais para fins acadêmicos e para a realização de estudos e pesquisas. Disponível em: https://www.gov.br/anpd/pt-br/centrais-de-conteudo/materiais-educativos-e-publicacoes/web-guia-anpd-tratamento-de-dados-para-fins-academicos.pdf.
- Repositório do Projeto Integrador: Fatec-Extensao/pi-ads-2026-1-bispo.

---

**Documento elaborado para a atividade de Segurança da Informação — LGPD e Anonimato.**
