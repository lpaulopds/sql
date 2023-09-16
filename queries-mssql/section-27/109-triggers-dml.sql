/* TRIGGERS */
CREATE TABLE PRODUTOS (
    IDPRODUTO INT IDENTITY PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    PRECO NUMERIC(10,2) NOT NULL
)
GO

CREATE TABLE HISTORICO (
    IDOPERACAO INT PRIMARY KEY IDENTITY,
    PRODUTO VARCHAR(50) NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    PRECOANTIGO NUMERIC(10,2) NOT NULL,
    PRECONOVO NUMERIC(10,2) NOT NULL,
    DATA DATETIME,
    USUARIO VARCHAR(30),
    MENSAGEM VARCHAR(100)
)
GO

INSERT INTO PRODUTOS VALUES ('LIVRO SQL SERVER','LIVROS', 98.00)
INSERT INTO PRODUTOS VALUES ('LIVRO ORACLE','LIVROS', 50.00)
INSERT INTO PRODUTOS VALUES ('LICENÇA POWERCENTER','SOFTWARES', 45000.00)
INSERT INTO PRODUTOS VALUES ('NOTEBOOK 17','COMPUTADORES', 3150.00)
INSERT INTO PRODUTOS VALUES ('LIVRO BUSINESS INTELIGENCE','LIVROS', 90.00)
GO

SELECT * FROM PRODUTOS
GO/*
IDPRODUTO   NOME                                               CATEGORIA                      PRECO       
----------- -------------------------------------------------- ------------------------------ ------------
          1 LIVRO SQL SERVER                                   LIVROS                                98.00
          2 LIVRO ORACLE                                       LIVROS                                50.00
          3 LICENÇA POWERCENTER                                SOFTWARES                          45000.00
          4 NOTEBOOK 17                                        COMPUTADORES                        3150.00
          5 LIVRO BUSINESS INTELIGENCE                         LIVROS                                90.00*/

SELECT * FROM HISTORICO
GO/*
IDOPERACAO  PRODUTO                                            CATEGORIA                      PRECOANTIGO  PRECONOVO    DATA                   
----------- -------------------------------------------------- ------------------------------ ------------ ------------ -----------------------*/

/* VERIFICANDO USUÁRIO */
SELECT SUSER_NAME()
GO

/* CRIA TRIGGER */
CREATE TRIGGER TRG_ATUALIZA_PRECO
    ON DBO.PRODUTOS
    FOR UPDATE
    AS
        DECLARE @IDPRODUTO INT
        DECLARE @PRODUTO VARCHAR(30)
        DECLARE @CATEGORIA VARCHAR(10)
        DECLARE @PRECO NUMERIC(10,2)
        DECLARE @PRECONOVO NUMERIC(10,2)
        DECLARE @DATA DATETIME
        DECLARE @USUARIO VARCHAR(30)
        DECLARE @ACAO VARCHAR(100)

        SELECT @IDPRODUTO = IDPRODUTO FROM INSERTED
        SELECT @PRODUTO = NOME FROM INSERTED
        SELECT @CATEGORIA = PRECO FROM DELETED
        SELECT @PRECONOVO = PRECO FROM INSERTED

        SET @DATA = GETDATE()
        SET @USUARIO = SUSER_NAME()
        SET @ACAO = 'VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO'

/* VER TRIGGERS */
SELECT NAME FROM sys.triggers
GO
SELECT * FROM sys.server_triggers
GO

/* ALTERANDO DADOS */
UPDATE PRODUTOS SET PRECO = 100.00
WHERE IDPRODUTO = 1
GO

SELECT * FROM PRODUTOS
SELECT * FROM HISTORICO
GO

/* ALTERANDO DADOS */
UPDATE PRODUTOS SET NOME = 'LIVRO C#'
WHERE IDPRODUTO = 1
GO

/* DELETANDO TRIGGER */
DROP TRIGGER TRG_ATUALIZA_PRECO

/*
    CRIANDO TRIGGER COM TSQL
    - VALORES VINDO DE TABELAS SÃO INSERIDOS
    COM O COMANDO SELECT.

    - VALORES VINDOS DE FUNÇÕES OU VALORES LITERAIS
    DEVEM SER ATRIBUIDOS COM O COMANDO SET.
*/
CREATE TRIGGER TRG_ATUALIZA_PRECO
    ON DBO.PRODUTOS
    FOR UPDATE AS
    IF UPDATE(PRECO)
    BEGIN
            DECLARE @IDPRODUTO INT
            DECLARE @PRODUTO VARCHAR(30)
            DECLARE @CATEGORIA VARCHAR(10)
            DECLARE @PRECO NUMERIC(10,2)
            DECLARE @PRECONOVO NUMERIC(10,2)
            DECLARE @DATA DATETIME
            DECLARE @USUARIO VARCHAR(30)
            DECLARE @ACAO VARCHAR(100)

            -- VALORES VINDOS DE TABELAS
            SELECT @IDPRODUTO = IDPRODUTO FROM INSERTED
            SELECT @PRODUTO = NOME FROM INSERTED
            SELECT @CATEGORIA = CATEGORIA FROM INSERTED
            SELECT @PRECO = PRECO FROM DELETED
            SELECT @PRECONOVO = PRECO FROM INSERTED

            -- VALORES LITERAIS
            SET @DATA = GETDATE()
            SET @USUARIO = SUSER_NAME()
            SET @ACAO = 'VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO'

            INSERT INTO HISTORICO
                (PRODUTO, CATEGORIA, PRECOANTIGO, PRECONOVO, DATA, USUARIO, MENSAGEM)
            VALUES
                (@PRODUTO, @CATEGORIA, @PRECO, @PRECONOVO, @DATA, @USUARIO, @ACAO)

            PRINT 'TRIGGER EXECUTADO COM SUCESSO'
    END
GO

UPDATE PRODUTOS SET PRECO = 300.00
WHERE IDPRODUTO = 2 
GO

SELECT * FROM HISTORICO
GO
/*
IDOPERACAO    PRODUTO                      CATEGORIA       PRECOANTIGO    PRECONOVO      DATA                       USUARIO      MENSAGEM                                      
-----------   --------------------------   -------------   ------------   ------------   -----------------------    ----------   ----------------------------------------------
          1   LIVRO ORACLE                 LIVROS          250.00         301.00         2023-09-16 05:12:06.813    sa           VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO
          2   LICENÇA POWERCENTER          SOFTWARES       250.00         302.00         2023-09-16 05:12:31.347    sa           VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO
          3   NOTEBOOK 17                  COMPUTADOR      250.00         303.00         2023-09-16 05:12:46.610    sa           VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO
          4   LIVRO BUSINESS INTELIGENCE   LIVROS          250.00         304.00         2023-09-16 05:12:58.307    sa           VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO
*/
