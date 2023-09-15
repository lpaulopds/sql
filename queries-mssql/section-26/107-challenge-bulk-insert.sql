/* UTILIZANDO BULK INSERT - DESAFIO UTILIZANDO CHARINDEX */

CREATE TABLE LANCAMENTO_CONTABIL(
    CONTA INT,
    VALOR INT,
    TIPO CHAR(1)
)
GO

SELECT * FROM LANCAMENTO_CONTABIL
GO

/*
    \t = TAB
    EXEMPLO DESCRITO NA AULA
*/
BULK INSERT LANCAMENTO_CONTABIL
    FROM '/home/lpaulopds/sql/CONTAS.txt'
WITH
(
    FIRSTROW = 2,
    DATAFILETYPE = 'char',
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n'
)
GO

/* EXEMPLO FUNCIONAL EM AMBIENTE DOCKER */
BULK INSERT LANCAMENTO_CONTABIL
    FROM '/home/lpaulopds/sql/CONTAS.txt' --location with filename
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\r'
)
GO

/* PROJETA DADOS DA TABELA */
SELECT * FROM LANCAMENTO_CONTABIL
GO

/* DELETA INSERÇÕES */
DELETE FROM LANCAMENTO_CONTABIL
GO

/*
    DESAFIO DO SALDO
        QUERY PARA PROJETAR SALDO DA CONTA
        PARA SABER SE É CREDOR OU DEVEDOR.
*/


