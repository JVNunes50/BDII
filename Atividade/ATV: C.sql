-- c)	Usando a mesma tabela, gere um relatorio que mostre
-- a.	O nome da empresa
-- b.	Quantidade de fatura ainda não pagar 
-- c.	Valor total ainda não pago
-- d.	Quantidade de fatura já pagas
-- e.	Valor ds faturas já pagas

SELECT
  e.Emp_RazaoSocial AS Empresa,
  SUM(CASE WHEN r.rec_pagto IS NULL THEN 1 ELSE 0 END) AS Qtd_abertorec,
  SUM(CASE WHEN r.rec_pagto IS NULL THEN ISNULL(r.rec_valor, 0) ELSE 0 END) AS Abertorec,
  SUM(CASE WHEN p.pag_pagto IS NULL THEN 1 ELSE 0 END) AS Qtd_aberto,
  SUM(CASE WHEN p.pag_pagto IS NULL THEN ISNULL(p.pag_valor, 0) ELSE 0 END) AS Aberto

FROM 
  empresa e
  LEFT JOIN pagar p ON e.Idempresa = p.fkempresa
  LEFT JOIN receber r ON e.Idempresa = r.fkempresa
GROUP BY
  e.Emp_RazaoSocial;
