-- b)	Use a tabela conta a receber para gerar um relatorio que mostre:
-- a.	O nome da empresa
-- b.	Quantidade de fatura ainda não pagar 
-- c.	Valor total ainda não pago

SELECT 
  Emp_razaoSocial AS Empresa,
  SUM(rec_valor) AS Total,
  SUM(1) AS Quantidade
  
FROM receber AS debito, empresa
WHERE fkempresa = idempresa
GROUP BY Emp_RazaoSocial
