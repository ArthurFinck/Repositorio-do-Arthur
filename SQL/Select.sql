#1. Liste os funcionários com salário acima da média.
SELECT nome, salario
FROM tb_empregado
WHERE salario > (SELECT AVG (salario) FROM tb_empregado);

#2. Liste os funcionários do sexo que possui mais pessoas.
SELECT nome, sexo
FROM tb_empregado
WHERE sexo = (SELECT sexo FROM tb_empregado GROUP BY sexo ORDER BY count(sexo)DESC LIMIT 1);

#3. Liste os funcionários do maior departamento.
SELECT nome
FROM tb_empregado
WHERE departamento_id = (SELECT departamento_id FROM tb_empregado GROUP BY departamento_id ORDER BY count(id_empregado) DESC LIMIT 1);

#4. Liste os funcionários do projeto que tem mais pessoas envolvidas.
SELECT e.nome
FROM tb_empregado e
JOIN tb_projeto_empregado on empregado_id = id_empregado
JOIN tb_projeto on id_projeto = projeto_id
WHERE projeto_id = (SELECT projeto_id FROM tb_projeto_empregado GROUP BY projeto_id ORDER BY count(empregado_id) DESC LIMIT 1);

#5. Liste o departamento do funcionário com o maior salário.
SELECT dep.nome
FROM tb_empregado
JOIN tb_departamento dep on departamento_id = id_departamento
WHERE salario = (SELECT MAX(salario) FROM tb_empregado);

#6. Lista os projetos em que o funcionário mais mal remunerado está
SELECT e.nome , p.nome , salario
FROM tb_empregado e
JOIN tb_projeto_empregado on empregado_id = id_empregado
JOIN tb_projeto p on id_projeto = projeto_id
WHERE salario = (SELECT MIN(salario) FROM tb_empregado);
