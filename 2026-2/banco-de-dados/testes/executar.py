# Testes do protótipo; biblioteca padrão Python e psql no PATH/PSQL.
from pathlib import Path
import os, subprocess, time, json

bd=Path(__file__).resolve().parent.parent
base=Path.cwd()
exe=os.environ.get('PSQL', 'psql')
if not os.environ.get('PGDATABASE','').startswith('bispo_'):
    raise SystemExit('Defina PGDATABASE para um banco descartável com prefixo bispo_.')
env=dict(os.environ, PGCLIENTENCODING='UTF8')
args=[exe,'-h',os.environ.get('PGHOST','127.0.0.1'),'-p',os.environ.get('PGPORT','5432'),'-U',os.environ.get('PGUSER','postgres'),'-d',os.environ['PGDATABASE'],'-X','-v','ON_ERROR_STOP=1']
def run(sql=None,extra=None,app=None):
    e=dict(env)
    if app:e['PGAPPNAME']=app
    r=subprocess.run(args+(extra or [])+(['-c',sql] if sql else []),env=e,capture_output=True,encoding='utf-8',errors='replace')
    return r
def check(r):
    if r.returncode:raise RuntimeError(r.stdout+r.stderr)
    return r
def scalar(sql):return check(run(sql,extra=['-At'])).stdout.strip()
assert scalar('SELECT count(*) FROM bispo_bd.submissao_anonima;')=='3', 'Use uma carga fictícia recém-criada, sem o teste concorrente já executado.'
result=check(run(extra=['-f',str(bd/'testes/validacao.sql')]))
(base/'sql-validation.txt').write_text(result.stdout+'\n'+result.stderr,encoding='utf-8')
check(run("INSERT INTO bispo_bd.token_individual(participacao_id,resumo_sha256) VALUES(3,encode(sha256(convert_to('ficticio-3b','UTF8')),'hex'));"))
payload=json.dumps([{'questao_id':1,'opcoes':[1]},{'questao_id':2,'opcoes':[1,2]}])
def start(sql,app):return subprocess.Popen(args+['-c',sql],env=dict(env,PGAPPNAME=app),stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True,encoding='utf-8',errors='replace')
sql_a=f"BEGIN; SELECT bispo_bd.finalizar(1,'ficticio-3','{payload}'); SELECT pg_sleep(4); COMMIT;"
sql_b=f"SELECT bispo_bd.finalizar(1,'ficticio-3b','{payload}');"
a=start(sql_a,'bispo_concorrencia_a')
deadline=time.monotonic()+8
while scalar("SELECT count(*) FROM pg_stat_activity WHERE application_name='bispo_concorrencia_a' AND wait_event='PgSleep';")!='1':
    if time.monotonic()>deadline:raise RuntimeError('A não chegou ao ponto de sincronização')
    time.sleep(.1)
b=start(sql_b,'bispo_concorrencia_b')
blocked=False
deadline=time.monotonic()+3
while time.monotonic()<deadline:
    if scalar("SELECT count(*) FROM pg_stat_activity WHERE application_name='bispo_concorrencia_b' AND wait_event_type='Lock';")=='1':
        blocked=True;break
    time.sleep(.1)
oa,ea=a.communicate(timeout=12);ob,eb=b.communicate(timeout=12)
assert a.returncode==0,(oa,ea)
assert b.returncode!=0 and 'já finalizada' in eb,(ob,eb)
assert blocked,'Não observou bloqueio concorrente'
final=scalar("SELECT (SELECT count(*) FROM bispo_bd.submissao_anonima), (SELECT count(*) FROM bispo_bd.participacao WHERE finalizada), (SELECT count(*) FROM bispo_bd.token_individual WHERE consumido);")
assert final=='4|4|4',final
report=f'''# Evidências de execução — PostgreSQL

Execução de reprodução: {scalar('SELECT version();')}, banco descartável `{os.environ["PGDATABASE"]}`,
conexão restrita a 127.0.0.1. Somente dados e credenciais fictícios.

## Validação sequencial

`schema.sql` e `dados-ficticios.sql` foram executados sem erro em banco vazio.
O teste `testes/validacao.sql` passou integralmente com `ON_ERROR_STOP=1`.
Todos os blocos mutáveis da validação sequencial foram revertidos.

```text
{result.stderr.strip()}
```

## Consultas — resultados antes da concorrência

- Q1: pesquisa 1 = 2 submissões; pesquisa 2 = 1.
- Q2: questão 1 = [1,1,0]; questão 2 = [1,2,0]; questão 3 = [1,0].
- Q3: categoria 1 = 1 pesquisa / 2 submissões; categoria 2 = 2 pesquisas / 3 submissões.
- Q4: pesquisa 1 = 6 autorizações / 2 finais / 4 pendentes; pesquisa 2 = 1 / 1 / 0.

As contagens das quatro consultas têm assertivas no SQL de validação.

## Concorrência real — duas conexões, tokens diferentes, mesma participação

A abriu transação, finalizou participação 3 e reteve o bloqueio por quatro segundos.
B tentou finalizar a mesma participação com outra credencial individual válida.
O estado `wait_event_type=Lock` da conexão B foi observado em `pg_stat_activity`.
A confirmou; B foi rejeitada após a revalidação. Não houve segunda submissão.

```text
Conexão A: exit {a.returncode}
{oa.strip()}
Conexão B: exit {b.returncode} (erro esperado)
{eb.strip()}
Contagens após concorrência: submissões | participações finais | tokens consumidos
{final}
```

## Limites

São testes do protótipo SQL, não do backend/web nem prova de anonimato absoluto.
O controle de identidade real, autenticação HTTP, autorização por proprietário,
política de divulgação, retenção e distribuição dos tokens continuam pendentes.
O dono do banco pode correlacionar transações, logs e conteúdo. Em produção,
logs e telemetria não devem registrar a associação entre token e respostas.
'''
(base/'evidencias-execucao.md').write_text(report,encoding='utf-8')
print('PASSOU: validação sequencial, 4 consultas e concorrência real com tokens distintos.')
