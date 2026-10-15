# Modelo lógico, mapeamento e normalização

Proposta PostgreSQL 18 vinculada ao [DER](./modelo-conceitual.md), às
[regras de Engenharia de Software](../engenharia-software/requisitos.md) e ao
[DDL executável](./schema.sql). As 13 tabelas estão no schema `bispo_bd`.

## Relações, chaves e mapeamento

| Relação | PK | Outras chaves e dependências de referência |
| --- | --- | --- |
| usuario | id | identificador UNIQUE, obrigatório e não vazio |
| usuario_papel | usuario_id, papel | FK usuario_id → usuario; valores de papel limitados |
| categoria | id | nome UNIQUE, obrigatório e não vazio |
| pesquisa | id | FK proprietario_id → usuario; título e estado |
| pesquisa_categoria | pesquisa_id, categoria_id | Duas FKs; resolve classificação N:M |
| questionario | id | pesquisa_id UNIQUE + FK → pesquisa; no máximo um por pesquisa |
| questao | id | FK questionario_id → questionario; UNIQUE(questionario_id, ordem) |
| opcao | questao_id, numero | FK questao_id → questao; número identifica opção dentro da questão |
| participacao | id | UNIQUE(pesquisa_id, identidade_id); FKs → pesquisa/usuario |
| token_individual | id | resumo_sha256 UNIQUE; FK participacao_id → participacao |
| submissao_anonima | id UUID aleatório | FK pesquisa_id → pesquisa; sem vínculo nominal ou horário |
| resposta_anonima | submissao_id, questao_id | FKs → submissao_anonima/questao; uma resposta por questão/submissão |
| resposta_opcao | submissao_id, questao_id, numero_opcao | FK composta → resposta_anonima; FK(questao_id, numero_opcao) → opcao |

Uma classe conceitual não corresponde necessariamente a uma tabela. Papéis
multivalorados de Usuario originam `usuario_papel`; associações N:M originam
`pesquisa_categoria` e `resposta_opcao`. O identificador conceitual de Opcao é
materializado como o par questão/número. Não existe `resposta_id` global redundante.

## Normalização até a 3FN

- **1FN:** não há listas de opções, categorias ou papéis em colunas; esses
  conjuntos são linhas em relações próprias. O JSON é formato de entrada da
  função, não forma de persistência. Campos textuais armazenam um valor por linha.
- **2FN:** atributos de tabelas com chave simples dependem da chave inteira.
  Em `opcao`, `rotulo` depende do par questão/número, e não de um componente.
  Nas demais relações de chave composta, todos os atributos compõem a chave;
  não existem atributos não chave dependentes de parte dela.
- **3FN:** nenhuma relação replica nome da categoria, título da pesquisa,
  enunciado da questão ou identidade do proprietário em relações dependentes.
  Os atributos não chave dependem diretamente das chaves candidatas, sem
  dependências transitivas documentadas. `identificador`, `nome` e
  `resumo_sha256` são chaves candidatas alternativas nas respectivas relações.

A opção não recebe ID global no modelo físico: assim, em `resposta_opcao`, não
se introduz a dependência transitiva `opcao_id → questao_id`. A associação usa
diretamente a chave contextual da opção, permitindo validar a opção pela FK.
Não se persiste `pesquisa_id` redundante em `resposta_anonima`; o vínculo entre a
questão e a pesquisa da submissão é validado pela função de escrita controlada.

## Restrições e responsabilidades

| Regra | Garantia e limite |
| --- | --- |
| Pessoa única por pesquisa | UNIQUE(pesquisa_id, identidade_id); depende de o cadastro representar corretamente uma pessoa elegível. |
| Token individual | Hash SHA-256 único, associado à participação; tokens reais precisam alta entropia, geração/distribuição segura e proteção de logs. |
| Uma questão por resposta | PK(submissao_id, questao_id). |
| Opção existente e da questão | FK composta de resposta_opcao → opcao. |
| Resposta no questionário correto | Função `finalizar` valida antes de confirmar; conta de execução não deve receber escrita direta. |
| Seleção única/múltipla e obrigatoriedade | Validação na função; envio vazio, questão duplicada e opção repetida são rejeitados. |
| Estrutura imutável durante coleta | Triggers permitem editar questionário/questão/opção só em rascunho; transições impedem voltar a rascunho. |
| Estrutura mínima | Abertura exige questões e opções; em rascunho pode haver montagem incompleta. |
| Atomicidade | A função grava respostas e atualiza token/participação em uma transação do chamador. |
| Concorrência | Bloqueio de participação/token e revalidação; duas tentativas não criam duas submissões. |
| Sem vínculo nominal direto | Ausência de FK/colunas nominais nas respostas. Não impede correlação por administrador, infraestrutura, transação ou conteúdo. |

As FKs usam bloqueio de exclusão referencial por padrão, sem cascatas destrutivas.
Retenção e exclusão são decisões abertas; não há procedimento de limpeza de
dados reais nesta versão. Remover uma participação pendente sem tokens e sem
referências é permitido; não há trigger que silenciosamente ignore DELETE.

## Contrato da finalização

```sql
BEGIN;
SELECT bispo_bd.finalizar(
  1,
  'credencial-ficticia',
  '[{"questao_id":1,"opcoes":[1]},{"questao_id":2,"opcoes":[1,2]}]'::jsonb
);
COMMIT;
```

O exemplo ilustra a interface, não uma credencial real. A função retorna apenas
booleano; não retorna ID de submissão. A confirmação ao usuário só pode ocorrer
após commit. Se o chamador já abriu uma transação e depois fizer rollback,
nenhuma finalização permanece. Em autocommit, a chamada completa é uma transação.
Reenvio após commit é rejeitado como participação já finalizada, sem duplicação.

O serviço conhece identidade/token e conteúdo durante a operação; não deve
registrar sua associação em logs, telemetria ou respostas HTTP. Falta implementar
autenticação web, verificação de identidade, autorização por proprietário e
políticas operacionais. SHA-256 não protege tokens curtos contra adivinhação.

## Permissões de execução

O DDL revoga acesso público ao schema, tabelas, sequências e funções. Uma conta
de execução futura deve receber somente USAGE no schema e EXECUTE em `finalizar`,
como demonstrado no teste com papel NOLOGIN descartável. Ela não deve possuir
o schema ou direitos de escrita direta nas respostas/controle.

`finalizar` usa SECURITY DEFINER com `search_path` fixo e tabelas qualificadas.
O proprietário da função deve ser um papel controlado de migração, diferente
da conta do serviço. Privilégios administrativos continuam capazes de ignorar
regras, ler logs ou correlacionar dados: não se declara anonimato absoluto.
Gestão, leitura de resultados e RLS por proprietário ficam para a implementação
do backend; as consultas fornecidas são demonstrações para ambiente autorizado.

[Voltar para Banco de Dados](./README.md)
