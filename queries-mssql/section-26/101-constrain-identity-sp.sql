/*
    CONSTRAINTS NOMEADAS, IDENTITY, SP_COLUMNS E SP_HELP
        - NA CRIAÇÃO DE TABELAS IDENTITY(1,1) = AUTO_INCREMENT
*/

/* CONECTA NO BANCO DE DADOS */
USE EMPRESA
GO

/* CRIA TABELA */
CREATE TABLE ALUNO(
    IDALUNO INT PRIMARY KEY IDENTITY,
    NOME VARCHAR(30) NOT NULL,
    SEXO CHAR(1) NOT NULL,
    NASCIMENTO DATE NOT NULL,
    EMAIL VARCHAR(30) UNIQUE
)
GO

/* VERIFICANDO TABELAS DO BANCO DE DADOS */
SELECT name FROM sys.tables
GO

/* VER DESCRIÇÃO DA TABELA */
EXEC SP_HELP 'dbo.aluno'
/* OU */
SP_HELP 'aluno'
GO

/*
    EXIBE CATÁLOGO DO SISTEMA COM INFOS DE METADADOS
    DE OBJETO SOBRE TABELAS, ESQUEMA E COLUNAS.
*/
SELECT s.name as schema_name, t.name as table_name, c.* FROM sys.columns AS c
INNER JOIN sys.tables AS t ON t.object_id = c.object_id
INNER JOIN sys.schemas AS s ON s.schema_id = t.schema_id
WHERE t.name = 'aluno' AND s.name = 'dbo';

/*
    CONSTRAINTS
    IGUAL O MYSQL, É IMPORTANTE CRIAR AS 'CONSTRAINTS'
    DEPOIS DA CRIAÇÃO DA TABELA PARA PODER NOMEA-LAS.

    NÃO EXISTE ENUM NO SQL SERVER, ENTÃO,
    CHECK É UMA ALTERNATIVA, SENDO IMPLEMENTADO
    NA CRIAÇÃO DAS CONSTRAINTS.
*/
ALTER TABLE ALUNO
ADD CONSTRAINT CK_SEXO CHECK (SEXO IN('M','F'))
GO

/*
    - RELACIONAMENTO ENTRE TABELAS 1x1 [ALUNO-ENDERECO].
    - CHECK NA CRIAÇÃO DA TABELA [CHECK=ENUM].
    - IDENTITY INICIA OS IDS NO 100 E VAI INCREMENTANDO
      DE 10 EM 10.
*/
CREATE TABLE ENDERECO (
    IDENDERECO INT PRIMARY KEY IDENTITY(100,10),
    BAIRRO VARCHAR(30),
    UF CHAR(2),
    CHECK (UF IN('RJ','SP','MG')),
    ID_ALUNO INT UNIQUE
)
GO

/* VERIFICANDO TABELAS DO BANCO DE DADOS */
SELECT name FROM sys.tables
GO

/* CRIA CHAVE ESTRANGEIRA PARA TABELA ENDERECO */
ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_ALUNO
FOREIGN KEY(ID_ALUNO) REFERENCES ALUNO(IDALUNO)
GO

/*
    COMANDOS DE DESCRIÇÃO 
        - OS COMANDOS DE DESCRIÇÃO SÃO INVOCADOS
        POR SP_[...](STORAGED) PROCEDURES JÁ CRIADAS
        E ARMAZENADAS NO SISTEMA.
        - AS COLLATIONS PODEM SER DEFINIDAS NA INSTÂNCIA,
        NO BANCO, TABELA OU COLUNA.
*/

SP_COLUMNS ALUNO
GO

SP_HELP ALUNO
GO

/* INSERINDO DADOS */
INSERT INTO ALUNO VALUES ("ANDRE", "M", "1981/04/23", "ANDRE@IG.COM")
INSERT INTO ALUNO VALUES ("ANA", "M", "1943/03/21", "ANA@IG.COM")
INSERT INTO ALUNO VALUES ("RUI", "M", "1953/01/01", "RUI@IG.COM")
INSERT INTO ALUNO VALUES ("JOAO", "M", "1987/05/03", "JOAO@IG.COM")
INSERT INTO ALUNO VALUES ("MARIA", "M", "1997/02/05", "MARIA@IG.COM")
GO