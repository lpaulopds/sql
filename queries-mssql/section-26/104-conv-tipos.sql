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


/* FUNÇÕES DE CONVERSÃO DE DADOS */
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
DATENAME(DAY, NASCIMENTO) + '/' +
DATENAME(MONTH, NASCIMENTO) + '/' +
DATENAME(YEAR, NASCIMENTO)
FROM ALUNO
GO/*
NOME                                          
------------------------------ ---------------
ANDRE                          23/April/1981  
ANA                            21/March/1943  
RUI                            1/January/1953 
JOAO                           3/May/1987     
MARIA                          5/February/1997*/

/* CORREÇÃO [SECTION 26 AULA 105] */
SELECT NOME,
CAST(DAY(NASCIMENTO) AS VARCHAR) + '/' +
CAST(MONTH(NASCIMENTO) AS VARCHAR) + '/' +
CAST(YEAR(NASCIMENTO) AS VARCHAR) AS "NASCIMENTO"
FROM ALUNO
GO/*
NOME                           NASCIMENTO                    
------------------------------ ------------------------------
ANDRE                          23/4/1981                     
ANA                            21/3/1943                     
RUI                            1/1/1953                      
JOAO                           3/5/1987                      
MARIA                          5/2/1997*/
