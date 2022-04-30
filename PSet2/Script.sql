/* Questão 01 */
SELECT nome_departamento AS Departamento, CONCAT('R$', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial
FROM funcionarios f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento
GROUP BY nome_departamento;
