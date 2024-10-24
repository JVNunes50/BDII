CREATE PROC alterarPagar
	@idpagar INT,
	@pag_descricao VARCHAR(45),
	@pag_valor NUMERIC(18,2),
	@fkempresa INT,
	@pag_vencimento DATETIME,
	@pag_pagto DATE,
	@pag_fatura VARCHAR(20)

AS
	IF @idpagar IS NULL
		BEGIN
			INSERT INTO pagar (idpagar, pag_descricao, pag_valor, fkempresa, pag_vencimento, pag_pagto, pag_fatura)
			VALUES (	
				@idpagar,
				@pag_descricao,
				@pag_valor,
				@fkempresa,
				@pag_vencimento,
				@pag_pagto,
				@pag_fatura
				);
		END
	ELSE
		BEGIN
			UPDATE pagar 
			SET pag_descricao = @pag_descricao,
				pag_valor = @pag_valor,
				fkempresa = @fkempresa,
				pag_vencimento = @pag_vencimento,
				pag_pagto = @pag_pagto,
				pag_fatura = @pag_fatura

			WHERE idpagar = @idpagar
		END

EXEC alterarPagar;
