CREATE TRIGGER test
ON pagar  -- Tabela que a trigues esta sendo ligada
AFTER INSERT, UPDATE, DELETE
AS
	IF (SELECT * FROM inserted) AND NOT(SELECT * FROM deleted) SELECT "INSERCAO"

	IF (SELECT * FROM inserted) AND (SELECT * FROM deleted) SELECT "UPDATE"

	IF (SELECT * FROM deleted) AND NOT (SELECT * FROM inserted) SELECT "EXCLUSAO"

  
--------------------------------------------------------------------------------------------------------------------------

  
CREATE TRIGGER FaturaExcluidas
ON pagar FOR delete
AS
DECLARE @cont INT
-- SELECT @cont = count(*) FROM deleted
-- SELECT 'Você excluido' + cast(@cont as varchar(3)) + 'linha(s)'

SELECT * FROM deleted
SELECT * FROM pagar

delete FROM pagar
WHERE idpagar < 100


  
-------------------------------------------------------------------------------------------------------------------------


CREATE TRIGGER FaturaExcluir
ON pagar FOR delete
AS
INSERT INTO log (tabela, nr_fatura, descricao, data) (SELECT 'pagar', pag_fatura, pag_descricao, getdate() FROM deleted)
