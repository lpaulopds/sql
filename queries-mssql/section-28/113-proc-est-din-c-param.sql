/* 
    PROCEDURES
    AS FUNÇÕES [SHOW, DESC E OUTRAS] SÃO TRATADAS
    NO MSSQL COMO STORAGE_PROCEDURE, INICIADAS COM [SP_*] 
*/
CREATE TABLE PESSOA(
    IDPESSOA INT PRIMARY KEY IDENTITY,
    NOME VARCHAR(30) NOT NULL,
    SEXO CHAR(1) NOT NULL CHECK (SEXO IN('M','F')),
    NASCIMENTO DATE NOT NULL
)
GO

CREATE TABLE TELEFONEPESSOA(
    IDTELEFONE INT NOT NULL IDENTITY,
    TIPO CHAR(3) NOT NULL CHECK (TIPO IN('CEL','COM')),
    NUMERO CHAR(10) NOT NULL,
    ID_PESSOA INT
)
GO

/* ADD CONSTRAINT PARA CHAVE ESTRANGEIRA NA TABELA TELEFONE */
ALTER TABLE TELEFONEPESSOA ADD CONSTRAINT FK_TELEFONE_PESSOA
    FOREIGN KEY (ID_PESSOA) REFERENCES PESSOA(IDPESSOA)
        ON DELETE CASCADE
GO

INSERT INTO PESSOA VALUES('ANTONIO','M','1981-02-13')
INSERT INTO PESSOA VALUES('DANIEL','M','1981-03-18')
INSERT INTO PESSOA VALUES('CLEIDE','F','1979-10-10')
INSERT INTO PESSOA VALUES('FAMAR','F','1989-11-6')
GO

INSERT INTO TELEFONEPESSOA VALUES ('CEL', '9812882',1)
INSERT INTO TELEFONEPESSOA VALUES ('COM', '8754768',1)
INSERT INTO TELEFONEPESSOA VALUES ('CEL', '7654879',2)
INSERT INTO TELEFONEPESSOA VALUES ('CEL', '9831829',2)
INSERT INTO TELEFONEPESSOA VALUES ('COM', '7812908',2)
INSERT INTO TELEFONEPESSOA VALUES ('CEL', '9812734',2)
GO

/* EXEMPLODE  SCRIPT PARA DELETAR DATABASES */
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name - N'EMPRESA'
GO
USE [master]
DROP DATABASE [EMPRESA]

/* CRIA A PROCEDURE */
CREATE PROC SOMA
    AS SELECT 10 + 10 SOMA
GO

/* EXECUÇÃO DA PROCEDURE */
/* MANEIRA SIMPLES */
SOMA 
GO

/* MANEIRA IDEAL */
EXEC SOMA
GO

/* 
    DINÂMICAS - COM PARÂMETROS
        - VARIÁVEIS DECLARADAS COM APENAS UM [@],
        SÃO VARÁVEIS LOCAIS.
        - VARIÁVEIS DECLARADAS COM DOIS [@@]
        SÃO VARIÁVEIS GLOBAIS.
*/
CREATE PROC CONTA @NUM1 INT, @NUM2 INT
AS
    SELECT @NUM1 + @NUM2
GO

/* EXECUTANDO PROCEDURE COM PARÂMETROS */
EXEC CONTA 90, 78
GO

/* APAGANDO PROCEDURE */
DROP PROC CONTA
GO

/* VER PROCEDURES DO BANCO DE DADOS */
SELECT * FROM sys.procedures 
GO

/* PROCEDURES EM TABELAS */
SELECT NOME, NUMERO 
    FROM PESSOA
    INNER JOIN TELEFONE
        ON IDPESSOA = ID_PESSOA
    WHERE TIPO = 'CEL'
GO

/*
    PROCEDURE PARA PROJETAR TELEFONES DE ACORDO
    COM PARÂMETRO INPUT
*/
CREATE PROC TELEFONES @TIPO CHAR(3)
AS 
SELECT NOME, NUMERO
    FROM PESSOA
    INNER JOIN TELEFONEPESSOA
    ON IDPESSOA = ID_PESSOA
        WHERE TIPO = @TIPO
GO

/* EXECUTANDO PROCEDURE */
EXEC TELEFONES 'CEL'
GO

EXEC TELEFONES 'COM'
GO

SELECT TIPO, COUNT(*) AS QUANTIDADE
    FROM TELEFONE
    GROUP BY TIPO
GO

CREATE PROC GETTIPO @TIPO CHAR(3), @CONTADOR INT OUTPUT
AS
SELECT @CONTADOR = COUNT(*)
    FROM TELEFONE
    WHERE TIPO = @TIPO
GO

/*
    PROCEDURE COM PARÂMETROS DE OUTPUT
        - O [OUTPUT] É CHAMADO AO LADO DO TIPO DA VARIÁVEL
*/
DECLARE @SAIDA INT /* [RESERVA UM ESPAÇO NA MEMÓRIA] */
    EXEC GETTIPO @TIPO = 'CEL', @CONTADOR = @SAIDA OUTPUT
    SELECT @SAIDA
GO

/* PROCEDURE OTIMIZADA */
DECLARE @SAIDA INT
    EXEC GETTIPO 'CEL', @SAIDA OUTPUT
    SELECT @SAIDA
GO
