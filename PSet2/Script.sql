/* Questão 01 */
SELECT nome_departamento AS Departamento, CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial FROM funcionários f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento GROUP BY nome_departamento;


/* Questão 02 */
SELECT CASE WHEN sexo = 'M' THEN 'Masculino' WHEN sexo = 'm' THEN 'Masculino' WHEN sexo = 'F' THEN 'Feminino' WHEN sexo = 'f' THEN 'Feminino' END AS Sexo,
CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial FROM funcionarios GROUP BY Sexo;
