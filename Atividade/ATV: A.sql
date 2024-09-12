-- a)	Use a tabela conta a pagar para gerar um relatorio com o seguinte layout
-- Obs: Os dia em atraso devem ser calculados somente para fatura NÃO PAGAS e que estejam com o pagamento em atraso. Caso contrario, o campo atraso deve ser zero.

SELECT 
  Emp_razaoSocial AS Empresa,
  idpagar AS IDfatura,
  pag_fatura AS Fatura,
  pag_descricao AS Descricao,
  pag_valor AS Valor,
  pag_vencimento AS Vencimento,
  pag_pagto AS Pagamento,

  CASE WHEN pag_pagto IS NULL THEN 
    CASE WHEN getdate() > pag_vencimento THEN datediff(dd, pag_vencimento, getdate()) ELSE 0 END ELSE 0 END AS Atrasado

FROM pagar, empresa
  WHERE fkempresa = idempresa
  
ORDER BY Vencimento
