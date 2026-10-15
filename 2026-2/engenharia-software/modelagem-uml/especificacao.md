# Especificação UML — proposta para revisão

> Base: levantamento documental do repositório bispo, 15/10/2026.
> As escolhas detalhadas são propostas, não decisões oficiais nem código pronto.

Esta entrega atende ao conteúdo solicitado nas [issues #1](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/1)
e [#2](https://github.com/Fatec-Extensao/pi-ads-2026-1-bispo/issues/2).
Fontes, requisitos, fluxos de casos de uso e lacunas estão em
[requisitos.md](../requisitos.md). Não existe esquema SQL neste repositório para
alegar compatibilidade já validada. O diagrama de classes é conceitual.

## Artefatos e edição

| Diagrama | Imagem e fonte vetorial editável | Fonte textual |
| --- | --- | --- |
| Casos de uso | [casos-de-uso.svg](./casos-de-uso.svg) | Bloco PlantUML abaixo |
| Classes | [classes.svg](./classes.svg) | Bloco PlantUML abaixo |
| Sequência | [sequencia.svg](./sequencia.svg) | Bloco PlantUML abaixo |

SVG é um formato de imagem permitido e pode ser editado como XML ou em editor
vetorial. Os blocos PlantUML oferecem uma representação textual alternativa
editável, para colar em ferramenta compatível; o layout gerado por ela pode diferir
do SVG. Os SVGs foram desenhados diretamente, não exportados pelo PlantUML.
Não foram incluídos formatos de documento proibidos pelo README.

## Casos de uso

![Casos de uso](./casos-de-uso.svg)

UC01/UC09 propõem responsabilidades do administrador; UC02/UC03/UC08, do
proprietário; UC04/UC05/UC06, do respondente. UC06 inclui UC07 obrigatoriamente
para evitar confiar apenas na validação inicial ou na interface.
Consultas de resultados estão sujeitas a autorização e política de divulgação.

```plantuml
@startuml
left to right direction
actor Administrador as A
actor "Proprietário" as P
actor Respondente as R
rectangle "Sistema web de pesquisas — proposta" {
  usecase "UC01 Gerenciar categorias" as UC01
  usecase "UC09 Gerenciar permissões" as UC09
  usecase "UC02 Gerenciar questionário / pesquisa" as UC02
  usecase "UC03 Autorizar participação" as UC03
  usecase "UC08 Consultar resultados" as UC08
  usecase "UC04 Validar acesso" as UC04
  usecase "UC05 Preencher questionário" as UC05
  usecase "UC06 Finalizar participação" as UC06
  usecase "UC07 Validar envio e autorização" as UC07
}
A -- UC01
A -- UC09
P -- UC02
P -- UC03
P -- UC08
R -- UC04
R -- UC05
R -- UC06
UC06 ..> UC07 : <<include>>
@enduml
```

## Classes conceituais

![Classes conceituais](./classes.svg)

| Classe | Responsabilidade | Rastreabilidade |
| --- | --- | --- |
| Usuario | Representar identidade de gestão/elegibilidade no controle restrito; papéis a validar. | RF06, RF08, RF11 |
| Pesquisa | Reunir propósito, proprietário, classificação e elegibilidade da coleta. | RF01, RF05, RF06, RN07 |
| Categoria | Classificar pesquisas. | RF05, issue #3 |
| Questionario | Organizar a estrutura apresentada na pesquisa. | RF01, RN02, RN08 |
| Questao | Representar enunciado, ordem e eventual obrigatoriedade. | RF01, RF03 |
| Opcao | Representar alternativa de questão fechada. | RF01, issue #3 |
| Participacao | Controlar autorização e unicidade nominal por pesquisa. | RF07, RF08, RN03 |
| TokenIndividual | Representar credencial individual por resumo seguro e estado de consumo. | RF07, RN04 |
| SubmissaoAnonima | Agrupar respostas de um preenchimento, sem FK nominal. | RF09, RN05 |
| Resposta | Registrar conteúdo referente a uma questão e suas opções quando aplicáveis. | RF03, RF09 |

As multiplicidades 1:1 Pesquisa–Questionario, 1:N Questionario–Questao e N:M
Pesquisa–Categoria são **propostas**: não há documento do colega que as fixe.
Questões sem opções permitem discussão de tipos abertos, sem defini-los como
escopo confirmado. A associação Resposta–Opcao é 0..*: seleção simples ou múltipla
precisa ser decidida por tipo de questão. A implementação deve validar que questão
e opções pertencem ao questionário da pesquisa da submissão.

Usuario–Participacao abstrai a identidade de elegibilidade; não determina login
por conta cadastrada, matrícula, e-mail ou outro identificador. A chave única é o
par pesquisa/identidade de elegibilidade, e não apenas o token.
Participacao–TokenIndividual permite histórico de credenciais como proposta; a
quantidade de tokens ativos e as regras de reemissão são pendentes.

Composição é indicada por losango cheio. Não há associação entre os objetos
nominais Participacao/TokenIndividual e SubmissaoAnonima/Resposta. Submissões
podem ser correlacionadas por conteúdo mesmo sem esse vínculo: os limites estão
em RNF01 e na seção de anonimato dos requisitos.

```plantuml
@startuml
class Usuario {
  id: Identificador
  papeis: Conjunto [P]
}
class Pesquisa {
  id: Identificador
  titulo: Texto
  aceitaRespostas(): Boolean
}
class Categoria {
  id: Identificador
  nome: Texto
}
class Questionario {
  id: Identificador
  validarEstrutura()
}
class Questao {
  id: Identificador
  enunciado: Texto
  ordem: Inteiro
  obrigatoria: Boolean [P]
}
class Opcao {
  id: Identificador
  rotulo: Texto
  ordem: Inteiro
}
class Participacao {
  id: Identificador
  identidadeElegibilidade: Chave
  finalizada: Boolean
  validarUnicidade()
}
class TokenIndividual {
  id: Identificador
  resumoSeguro: Texto
  consumido: Boolean
  validar()
}
class SubmissaoAnonima {
  id: Identificador aleatorio
}
class Resposta {
  id: Identificador
  valor: Valor [tipo pendente]
}
Usuario "1" -- "0..*" Pesquisa : proprietario [P]
Usuario "1" -- "0..*" Participacao : elegivel [P]
Pesquisa "1" -- "0..*" Participacao : autoriza [P]
Participacao "1" *-- "0..*" TokenIndividual : [P]
Pesquisa "0..*" -- "0..*" Categoria : classifica [P]
Pesquisa "1" *-- "1" Questionario : [P]
Questionario "1" *-- "1..*" Questao : [P]
Questao "1" *-- "0..*" Opcao
Pesquisa "1" -- "0..*" SubmissaoAnonima : pertence a
SubmissaoAnonima "1" *-- "1..*" Resposta
Resposta "0..*" -- "1" Questao : responde
Resposta "0..*" -- "0..*" Opcao : seleciona [P]
note bottom of Participacao
  Unico (pesquisa, identidadeElegibilidade).
  Sem referencia a submissao/respostas.
end note
note bottom of SubmissaoAnonima
  Sem identidade, participacao ou token.
  Nao representa anonimato absoluto.
end note
@enduml
```

## Sequência de preenchimento e finalização

![Sequência](./sequencia.svg)

As classes técnicas ServicoPesquisa, ControleParticipacao e RepositorioAnonimo
representam responsabilidades de uma arquitetura proposta. Não significam que
backend ou autenticação já existam. Os dois repositórios usam **a mesma transação
e conexão de banco**, não bancos independentes sem coordenação.

1. O respondente informa a credencial. O serviço valida a autorização e carrega
   o questionário se houver acesso. Erro de acesso impede o preenchimento.
2. A tela permite preencher, avançar/voltar e revisar. Validação de interface
   melhora a experiência; o servidor continua responsável pela validação final.
3. Ao finalizar, o serviço inicia transação, bloqueia a participação e revalida
   token, pesquisa, unicidade, versão/estrutura e respostas. A verificação da
   pesquisa deve permanecer válida até o commit por bloqueio ou controle equivalente.
4. Grava submissão/respostas sem identificadores nominais e finaliza a participação,
   consumindo o token na mesma transação. Só confirma sucesso após commit.
5. Entrada inválida, token consumido, participação já finalizada ou falha de
   persistência levam a rollback. Não há resposta parcial nem token consumido
   sem respostas confirmadas.
6. Dois envios concorrentes para a mesma participação são serializados: após o
   primeiro commit, o segundo revalida e é rejeitado. A unicidade por identidade
   também deve ser imposta na criação das autorizações para impedir contorno com
   duas participações e tokens diferentes.
7. Se o commit ocorrer e a resposta de rede se perder, reenvio verifica o controle
   finalizado e não grava de novo. Pode informar que a participação foi concluída,
   mas não recuperar conteúdo anônimo por token.

```plantuml
@startuml
actor Respondente as R
boundary "Tela web" as T
control ServicoPesquisa as S
participant ControleParticipacao as C
participant RepositorioAnonimo as A
database "Banco de dados" as B
R -> T : Informar credencial e pesquisa
T -> S : Solicitar acesso
S -> C : Validar token / participação
C -> B : Consultar autorização e resumo do token
B --> C : Dados de controle
C --> S : Acesso válido ou erro
opt Acesso válido
  S -> B : Carregar questionário elegível
end
S --> T : Formulário ou erro de acesso
T --> R : Preencher, navegar e revisar (se válido)
R -> T : Confirmar envio
T -> S : Enviar credencial + respostas
group Transação única (mesma conexão de banco)
  S -> B : BEGIN
  S -> C : Travar e revalidar autorização
  C -> B : Bloquear participação; verificar token e unicidade
  S -> B : Revalidar pesquisa, questionário e respostas
  alt Autorização e respostas válidas; persistência sem falha
    S -> A : Gravar submissão SEM identidade/token
    A -> B : Inserir submissão e respostas
    S -> C : Finalizar participação e consumir token
    C -> B : Atualizar controle nominal
    S -> B : COMMIT
  else Inválido / já finalizada / falha em qualquer operação
    S -> B : ROLLBACK (nenhum efeito parcial)
  end
end
S --> T : Sucesso após COMMIT ou erro
T --> R : Mostrar confirmação ou erro
note over S,B
  Concorrência: bloquear, aguardar, revalidar.
  Reenvio após commit não cria nova submissão.
  Não persistir vínculo nominal com as respostas.
end note
@enduml
```

## Invariantes e critérios de revisão

| Cenário a testar na futura implementação | Resultado esperado |
| --- | --- |
| Token inválido ou de outra pesquisa | Não abre formulário nem grava respostas. |
| Resposta para questão/opção de outro questionário | Rejeita envio completo. |
| Falha após inserir respostas, antes de consumir token | Rollback das respostas; participação ainda disponível. |
| Falha após consumir token, antes de commit | Rollback de todos os efeitos. |
| Duas finalizações concorrentes da mesma participação | No máximo um commit com respostas; outra tentativa rejeitada. |
| Tentativa de criar duas autorizações para a mesma identidade/pesquisa | Unicidade impede duplicação. |
| Consulta de resultados por gestor sem autorização | Acesso negado. |
| Revisão de esquema, logs e payloads | Nenhum vínculo nominal persistido com submissão/respostas. |

Esses cenários são critérios futuros, **não testes executados**. A verificação
executada nesta entrega é documental e visual, registrada em
[verificacao.md](../verificacao.md). Validar as lacunas antes de declarar as issues
concluídas. Não foi alterado o banco de dados ou código da aplicação.

[Voltar para Engenharia de Software II](../README.md)
