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

/* RENOMEANDO NOME DA COLUNA [CORREÇÃO] */
USE EMPRESA;
EXEC sp_rename 'LANCAMENTO_CONTABIL.VALOT', 'VALOR';
EXEC sp_columns LANCAMENTO_CONTABIL;
GO

/*
    DESAFIO DO SALDO
        QUERY PARA PROJETAR SALDO DA CONTA
        PARA SABER SE É CREDOR OU DEVEDOR.
*/
SELECT CONTA, VALOR FROM LANCAMENTO_CONTABIL
WHERE TIPO = "D"
GO/*
(390 rows affected)*/

SELECT CONTA, VALOR FROM LANCAMENTO_CONTABIL
WHERE TIPO = "C"
GO/*
(507 rows affected)
*/

/* CORREÇÃO */
SELECT CONTA, VALOR,
    CHARINDEX('D',TIPO) AS "DEBITO",
    CHARINDEX('C',TIPO) AS "CREDITO"
        FROM LANCAMENTO_CONTABIL
GO/*
CONTA       VALOR       DEBITO      CREDITO    
----------- ----------- ----------- -----------
          2        4111           1           0
          2     6456145           1           0
          2       46545           1           0
          2    47986465           1           0
          2      478945           1           0
          2        9568           1           0
          2        5784           1           0
          1      478651           0           1
          1        4111           0           1
          1        4111           0           1
          1        4111           0           1
          4        4111           0           1
          4        4111           0           1
          4    45646556           0           1
          4       46545           0           1
          4    47986465           0           1*/

/* ENCONTRANDO MULTIPLICADOR */
SELECT CONTA, VALOR,
    CHARINDEX('D',TIPO) AS "DEBITO",
    CHARINDEX('C',TIPO) AS "CREDITO",
    CHARINDEX('C',TIPO) * 2 - 1 AS MULTIPLICADOR
        FROM LANCAMENTO_CONTABIL
GO/*
CONTA       VALOR       DEBITO      CREDITO     MULTIPLICADOR
----------- ----------- ----------- ----------- -------------
          1        9584           1           0            -1
          1       46545           1           0            -1
          1        4654           1           0            -1
          1    45646556           1           0            -1
          1       46545           1           0            -1
          1        9554           1           0            -1
          1          48           0           1             1
          1      478946           0           1             1
          1        7156           0           1             1
          1        4111           0           1             1
          1     6456145           0           1             1
          1       46545           0           1             1*/

/*
    C -> 1 * 2 - 1 =  1 [QUANDO FOR CRÉDITO O SALDO CONTINUA]
    D -> 0 * 2 - 1 = -1 [QUNADO FOR DÉBITO O SALDO É NEGATIVO]
*/
SELECT CONTA,
SUM(VALOR * (CHARINDEX('C',TIPO) * 2 - 1)) AS SALDO
    FROM LANCAMENTO_CONTABIL
    GROUP BY CONTA
GO
