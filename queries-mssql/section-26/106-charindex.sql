/* FUNÇÃO CHARINDEX
    - 3 PARAMETROS
    - O 3º PARAMETRO NÃO É OBRIGATÓRIO COM A CONTAGEM INICIANDO EM 01
    - RETORNA O INTEIRO DA STRING PESQUISADA, CONSULTE A COLUNA INDICE
        DA PROJEÇÃO ABAIXO E VEJA O NÚMERO INTEIRO INDICANDO A POSIÇÃO
        DA STRING 'A'.
*/

SELECT NOME, CHARINDEX('A', NOME) AS INDICE
    FROM ALUNO
GO/*
NOME                           INDICE     
------------------------------ -----------
ANDRE                                    1
ANA                                      1
RUI                                      0
JOAO                                     3
MARIA                                    2*/

/* 
    COM 3º PARAMETRO [2], INICIA A BUSCA NA 2º
    POSIÇÃO A CONTAGEM DO INTEIR CONTINUA A MESMA,
    MESMO INICIANDO A BUSCA APARTIR DO 2º ÍNDICE.
*/
SELECT NOME, CHARINDEX('A', NOME, 2) AS INDICE
    FROM ALUNO
GO/*
NOME                           INDICE     
------------------------------ -----------
ANDRE                                    0
ANA                                      3
RUI                                      0
JOAO                                     3
MARIA                                    2*/


