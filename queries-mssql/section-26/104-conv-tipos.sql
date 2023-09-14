/* CONVERSÃO DE DADOS */

SELECT 1 + '1'
GO/*
-----------
          2*/

/* TAMBÉM É USADO PARA CONCATENAR STRING */
SELECT '1' + '1'
GO/*
--
11*/

SELECT 'CURSO DE BANCO DE DADOS' + '1'
GO/*
------------------------
CURSO DE BANCO DE DADOS1*/


/* FUNÇÕES DE COVERSÃO DE DADOS */
SELECT CAST('1' AS INT) + CAST('1' AS INT)
GO/*
-----------
          2*/

/* CONVERSÃO E CONCATENAÇÃO */
SELECT NOME,
NASCIMENTO FROM ALUNO
GO

SELECT NOME,
MONTH(NASCIMENTO)
FROM ALUNO
GO/*
NOME                                      
------------------------------ -----------
ANDRE                                    4
ANA                                      3
RUI                                      1
JOAO                                     5
MARIA                                    2*/

SELECT NOME,
DAY(NASCIMENTO)
FROM ALUNO
GO/*
NOME                                      
------------------------------ -----------
ANDRE                                   23
ANA                                     21
RUI                                      1
JOAO                                     3
MARIA                                    5*/

SELECT NOME,
DAY(NASCIMENTO) + '/' + MONTH(NASCIMENTO) + '/' + YEAR(NASCIMENTO)
FROM ALUNO
GO/*
ERROR*/

SELECT NOME,
DAY(NASCIMENTO) + '/' +
MONTH(NASCIMENTO) + '/' +
YEAR(NASCIMENTO)
FROM ALUNO
GO
