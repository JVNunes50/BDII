ALTER PROC alterarPagar
	@idpagar INT,
	@pag_descricao VARCHAR(45),
	@pag_valor NUMERIC(18,2),
	@fkempresa INT,
	@pag_vencimento DATETIME,
	@pag_pagto DATE,
	@pag_fatura VARCHAR(20)

AS
	BEGIN TRY -- Verificação de erro
	IF @pag_valor >= 0
		 THROW 99999, 'Esse valor não pode ser inserido!', 1 -- Retorno de erro

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
	END TRY

	BEGIN CATCH -- Verificação de erro
		ROLLBACK TRANSACTION
		SELECT 'Erro :('
	END CATCH

EXEC alterarPagar;
