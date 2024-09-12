-- Use as tabelas pagar e receber para gerar um  fluxo de caixa que mostre:
-- Nome da empresa,
-- Idfatura
-- Descricao,
-- Valor do debito (para faturas do contas a pagar)
-- Valor do credito (para fatura do contas a receber)
-- Vencimento


SELECT * ,
CASE tipo WHEN 'p' THEN Valor ELSE 0 END AS Debito,
CASE tipo WHEN 'r' THEN Valor ELSE 0 END AS Credito,
Emp_RazaoSocial AS empresa FROM
  
(SELECT
  pag_descricao AS Descricao,
  pag_valor AS Valor,
  pag_vencimento AS Vencimento,
  pag_pagto AS pagto,
  fkempresa,
  'p' AS tipo
FROM pagar
  
UNION ALL
  
SELECT 
  rec_descricao,
  rec_valor,
  rec_pagto, 
  rec_vencimento,
  fkempresa,
  'r' AS tipo
FROM receber) AS prov,
  
empresa
WHERE pagto IS NULL
AND fkempresa = idempresa
ORDER BY Vencimento
