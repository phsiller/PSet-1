/* Questão 01 */
SELECT nome_departamento AS Departamento, CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial FROM funcionários f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento GROUP BY nome_departamento;


/* Questão 02 */
SELECT CASE WHEN sexo = 'M' THEN 'Masculino' WHEN sexo = 'm' THEN 'Masculino' WHEN sexo = 'F' THEN 'Feminino' WHEN sexo = 'f' THEN 'Feminino' END AS Sexo,
CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial FROM funcionarios GROUP BY Sexo;


/* Questão 03*/
SELECT nome_departamento AS Departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo,
data_nascimento AS Data_de_nascimento,
FLOOR(DATEDIFF(CURDATE(), data_nascimento)/325.25) AS Idade,
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário FROM funcionarios f INNER JOIN departamento d WHERE f.numero_departamento = d.numero_departamento
ORDER BY nome_departamento;
