/* Questão 01 */
SELECT nome_departamento AS Departamento, CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial FROM funcionario f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento GROUP BY nome_departamento;


/* Questão 02 */
SELECT CASE WHEN sexo = 'M' THEN 'Masculino' WHEN sexo = 'm' THEN 'Masculino' WHEN sexo = 'F' THEN 'Feminino' WHEN sexo = 'f' THEN 'Feminino' END AS Sexo,
CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial FROM funcionario GROUP BY Sexo;


/* Questão 03 */
SELECT nome_departamento AS Departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo,
data_nascimento AS Data_de_nascimento,
FLOOR(DATEDIFF(CURDATE(), data_nascimento)/325.25) AS Idade,
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário FROM funcionario f INNER JOIN departamento d WHERE f.numero_departamento = d.numero_departamento
ORDER BY nome_departamento;


/* Questão 04 */
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário, CONCAT('R$ ', CAST((salario*1.2) AS DECIMAL(10,2))) AS Novo_salário FROM funcionario f 
WHERE salario < '35000' UNION
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário, CONCAT('R$ ', CAST((salario*1.15) AS DECIMAL(10,2))) AS Novo_salário FROM funcionario f
WHERE salario >= '35000';


/* Questão 05 */
SELECT nome_departamento AS Departamento, g.primeiro_nome AS Gerente, f.primeiro_nome AS Funcionário, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário FROM departamento d INNER JOIN funcionarios f, 
(SELECT primeiro_nome, cpf FROM funcionario f INNER JOIN departamento d WHERE f.cpf = d.cpf_gerente) AS g
WHERE d.numero_departamento = f.numero_departamento AND g.cpf = d.cpf_gerente
ORDER BY d.nome_departamento ASC, f.salario DESC;


/* QUESTÃO 06 */
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, dto.nome_departamento AS Departamento,
dpd.nome_dependente AS Dependente, FLOOR(DATEDIFF(CURDATE(), dpd.data_nascimento)/365.25) AS Idade_dependente,
CASE WHEN dpd.sexo = 'M' THEN 'Masculino' WHEN dpd.sexo = 'm' THEN 'Masculino' WHEN dpd.sexo = 'F' THEN 'Feminino' WHEN dpd.sexo = 'f' THEN 'Feminino'
END AS Sexo_dependente
FROM funcionario f INNER JOIN departamento dto ON f.numero_departamento = dto.numero_departamento
INNER JOIN dependente dpd ON dpd.cpf_funcionario = f.cpf;
