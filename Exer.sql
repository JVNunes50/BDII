CREATE TABLE movbanco(
	IdMovbanco INT IDENTITY(1,1) NOT NULL PRIMARY KEY, --PK
	Movban_Descricao VARCHAR (30) NULL,
	Movban_Saldo NUMERIC (18, 2) NULL,
	Movban_date DATETIME,
	Movban_valor NUMERIC (18,2),
	Movban_tipo INT,
	fkbanco INT
)

ALTER TABLE movbanco
ADD CONSTRAINT fkbanco
FOREIGN KEY (fkbanco)
REFERENCES IdMovbanco (IdMovbanco);

--------------------------------------------------------------------------------------------------------------------------------------------------

DROP PROC sp_i_pagamento
go
CREATE PROC sp_I_pagamento (
	@idpagar int,
	@fatura VARCHAR(15),
	@fkbanco INT,
	@valor NUMERIC(18,2),
	@data DATE
)

AS

	DECLARE @saldo NUMERIC(18,2)
	SET @saldo = (SELECT Ban_saldo FROM banco WHERE IdBanco = @fkbanco)

	-- testa se a fatura existe
	IF NOT EXISTS (SELECT Ban_saldo FROM banco WHERE IdBanco = @fkbanco)
	BEGIN
		SELECT 'A fatura fornecida não existe!'
		return -1
	END








	
INSERT movbanco(
	Movban_descricao,
	Movban_date,
	Movban_valor,
	Movban_tipo,
	Movban_saldo,
	fkbanco 
)

VALUES

('pagto fatura' + ISNULL(@fatura,)'**') ISNULL (@data, getdate())
pag_pagto = ISNULL (@data, getdate()),
fkbanco = @fkbanco
WHERE idpagar = @idpagar
