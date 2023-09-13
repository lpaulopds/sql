/*
    FUNÇÃO IFNULL(), CLAUSULA AMBÍGUA E A FUNÇÃO GETDATE()    
*/

/*
    QUERIES PARA INSERIR DADOS NA TABELA ENDEREÇO
*/
INSERT INTO ENDERECO VALUES('FLAMENGO','RJ',1)
INSERT INTO ENDERECO VALUES('MORUMBI','SP'2)
INSERT INTO ENDERECO VALUES('CENTRO','MG',3)
INSERT INTO ENDERECO VALUES('CENTRO','SP',6)
GO

/*
    QUERIES PARA CRIAR TABELA TELEFONE
    RELACIONAMENTO 1xN
    CHECK = ENUM
*/
CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY IDENTITY,
    TIPO CHAR(3) NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    ID_ALUNO INT,
    CHECK (TIPO IN ('RES','COM','CEL'))
)
GO

/*
    QUERIES PARA INSERIR DADOS NA TABELA
*/
INSERT INTO TELEFONE VALUES ('CEL','7432890',1)
INSERT INTO TELEFONE VALUES ('RES','9432821',1)
INSERT INTO TELEFONE VALUES ('COM','4354354',2)
INSERT INTO TELEFONE VALUES ('CEL','2344556',2)
GO

/*
    QUERY PARA PROJETAR DADOS DA TABELA ALUNO
*/
SELECT * FROM ALUNO
GO

/*
    PROJETA DATA ATUAL
*/
SELECT GETDATE()
GO

/*
    CLAUSULA AMBIGUA
    QUERY COM PONTEIRAMENTE PARA COLUNAS
    C0M MESMO NOME EM TABELAS DIFERENTES
*/
SELECT A.NOME, T.TIPO, T.NUMERO, E.BAIRRO, E.UF
    FROM ALUNO A
INNER JOIN TELEFONE T
    ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
    ON A.IDALUNO = E.ID_ALUNO
GO/*
NOME                           TIPO NUMERO     BAIRRO                         UF
------------------------------ ---- ---------- ------------------------------ --
ANDRE                          CEL  7432890    FLAMENGO                       RJ
ANDRE                          RES  9432821    FLAMENGO                       RJ
ANA                            COM  4354354    MORUMBI                        SP
ANA                            CEL  2344556    MORUMBI                        SP*/

/*
    QUERY COM PONTEIRAMENTO PARA CLAUSULA AMBIGUA
    LEFT JOIN PARA TABELA DA ESQUERDA - TODOS OS ALUNOS
    MESMO SEM TELEFONE
*/
SELECT A.NOME, T.TIPO, T.NUMERO, E.BAIRRO, E.UF
    FROM ALUNO A LEFT JOIN TELEFONE T
        ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
    ON A.IDALUNO = E.ID_ALUNO
GO/*
NOME                           TIPO NUMERO     BAIRRO                         UF
------------------------------ ---- ---------- ------------------------------ --
ANDRE                          CEL  7432890    FLAMENGO                       RJ
ANDRE                          RES  9432821    FLAMENGO                       RJ
ANA                            COM  4354354    MORUMBI                        SP
ANA                            CEL  2344556    MORUMBI                        SP
RUI                            NULL NULL       CENTRO                         MG
MARIA                          NULL NULL       CENTRO                         SP*/

/*
    IFNULL = ISNULL
*/
SELECT  A.NOME,
        ISNULL(T.TIPO, 'SEM') AS "TIPO",
        ISNULL(T.NUMERO, 'NUMERO') AS "TELEFONE",
        E.BAIRRO,
        E.UF
    FROM ALUNO A LEFT JOIN TELEFONE T
        ON A.IDALUNO = T.ID_ALUNO
INNER JOIN ENDERECO E
    ON A.IDALUNO = E.ID_ALUNO
GO/*
NOME                           TIPO TELEFONE   BAIRRO                         UF
------------------------------ ---- ---------- ------------------------------ --
ANDRE                          CEL  7432890    FLAMENGO                       RJ
ANDRE                          RES  9432821    FLAMENGO                       RJ
ANA                            COM  4354354    MORUMBI                        SP
ANA                            CEL  2344556    MORUMBI                        SP
RUI                            SEM  NUMERO     CENTRO                         MG
MARIA                          SEM  NUMERO     CENTRO                         SP*/
