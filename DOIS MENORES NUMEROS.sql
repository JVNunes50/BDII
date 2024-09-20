SELECT * FROM(

SELECT ROW_NUMBER()

	OVER (PARTITION BY fkempresa ORDER BY pag_valor) as linha,
	*
	FROM pagar) AS tt
	WHERE linha IN (1,2)
