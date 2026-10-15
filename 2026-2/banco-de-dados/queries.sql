-- Relatórios demonstrativos sobre dados fictícios. Não define canal de entrega.
-- Requer perfil de gestão autorizado; não conceder acesso direto ao respondente.

-- Q1: submissões finalizadas por pesquisa; não há JOIN nominal com respostas.
SELECT p.id, p.titulo, count(s.id) AS total_submissoes
FROM bispo_bd.pesquisa p
LEFT JOIN bispo_bd.submissao_anonima s ON s.pesquisa_id = p.id
GROUP BY p.id, p.titulo ORDER BY p.id;

-- Q2: escolhas por questão/opção, inclusive alternativas com contagem zero.
-- Em seleção múltipla, a soma das opções pode superar o número de respondentes.
SELECT p.id AS pesquisa_id, q.id AS questao_id, q.enunciado, o.numero, o.rotulo,
       count(r.submissao_id) AS escolhas
FROM bispo_bd.pesquisa p
JOIN bispo_bd.questionario f ON f.pesquisa_id = p.id
JOIN bispo_bd.questao q ON q.questionario_id = f.id
JOIN bispo_bd.opcao o ON o.questao_id = q.id
LEFT JOIN bispo_bd.resposta_opcao r ON r.questao_id = o.questao_id AND r.numero_opcao = o.numero
GROUP BY p.id, q.id, q.enunciado, o.numero, o.rotulo
ORDER BY p.id, q.ordem, o.numero;

-- Q3: pesquisas e submissões por categoria. DISTINCT evita multiplicação por JOIN.
-- Categorias se sobrepõem; não somar as linhas para obter o total global.
SELECT c.id, c.nome, count(DISTINCT p.id) AS pesquisas,
       count(DISTINCT s.id) AS submissoes
FROM bispo_bd.categoria c
LEFT JOIN bispo_bd.pesquisa_categoria pc ON pc.categoria_id = c.id
LEFT JOIN bispo_bd.pesquisa p ON p.id = pc.pesquisa_id
LEFT JOIN bispo_bd.submissao_anonima s ON s.pesquisa_id = p.id
GROUP BY c.id, c.nome ORDER BY c.id;

-- Q4: auditoria agregada do controle de participação, separada das respostas.
-- Contagens nominais também exigem autorização e avaliação de grupos pequenos.
SELECT p.id, p.titulo, count(a.id) AS autorizacoes,
       count(a.id) FILTER (WHERE a.finalizada) AS finalizadas,
       count(a.id) FILTER (WHERE NOT a.finalizada) AS pendentes
FROM bispo_bd.pesquisa p
LEFT JOIN bispo_bd.participacao a ON a.pesquisa_id = p.id
GROUP BY p.id, p.titulo ORDER BY p.id;
