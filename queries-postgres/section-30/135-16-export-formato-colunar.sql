/* EXPORT EM FORMATO COLUNAR */

/*
    CRIANDO TABELA COM PROJEÇÃO DE UMA QUERY.
    PRIMEIRO CRIA A QUERY PARA DEPOIS CRIAR TABELA
    EM FORMATO COLUNAR (CREATE TABLE [TABLE NAME] AS [QUERY])
*/
SELECT F.NOME, G.NOME, L.DATA, L.DIAS, L.MIDIA
    FROM GENERO G
        INNER JOIN FILME F
            ON G.IDGENERO = F.ID_GENERO
        INNER JOIN LOCACAO L
            ON L.ID_FILME = F.IDFILME;
/*
         nome          |   nome   |    data    | dias | midia 
-----------------------+----------+------------+------+-------
 KILL BILL I           | AVENTURA+| 2019-01-08 |    3 |    23
 UM SONHO DE LIBERDADE | DRAMA    | 2019-01-02 |    1 |    56
 UM SONHO DE LIBERDADE | DRAMA    | 2019-02-07 |    3 |    23
 OS BAD BOYS           | AÇÃO    +| 2019-02-02 |    1 |    43
 KILL BILL I           | AVENTURA+| 2019-02-02 |    2 |    23
 CADILLAC RECORDS      | DRAMA    | 2019-03-07 |    3 |    76
 CADILLAC RECORDS      | DRAMA    | 2019-03-02 |    1 |    45
 KILL BILL I           | AVENTURA+| 2019-04-08 |    3 |    89
 O HOBBIT              | FANTASIA+| 2019-04-02 |    3 |    23
 OS BAD BOYS           | AÇÃO    +| 2019-05-07 |    3 |    23
 O HOBBIT              | FANTASIA+| 2019-05-02 |    3 |    38
 KILL BILL I           | AVENTURA+| 2019-01-10 |    1 |    56
 UM SONHO DE LIBERDADE | DRAMA    | 2019-06-12 |    3 |    23
 SENHOR DOS ANEIS      | FANTASIA+| 2019-01-02 |    2 |    56
 SENHOR DOS ANEIS      | FANTASIA+| 2019-04-10 |    3 |    76
 UM SONHO DE LIBERDADE | DRAMA    | 2019-01-09 |    2 |    32
 KILL BILL I           | AVENTURA+| 2019-08-02 |    3 |    89
 DRACULA               | SUSPENSE+| 2019-01-02 |    1 |    23
 SENHOR DOS ANEIS      | FANTASIA+| 2019-08-09 |    3 |    45
 UM SONHO DE LIBERDADE | DRAMA    | 2019-01-12 |    1 |    89
 CORRIDA MORTAL        | AÇÃO    +| 2019-09-07 |    3 |    23
 CORRIDA MORTAL        | AÇÃO    +| 2019-01-12 |    3 |    21
 KILL BILL I           | AVENTURA+| 2019-01-02 |    2 |    34
 CORRIDA MORTAL        | AÇÃO    +| 2019-09-08 |    1 |    67
 CORRIDA MORTAL        | AÇÃO    +| 2019-01-02 |    3 |    76
 DRACULA               | SUSPENSE+| 2019-01-02 |    3 |    66
 UM SONHO DE LIBERDADE | DRAMA    | 2019-09-12 |    1 |    90
 KILL BILL I           | AVENTURA+| 2019-03-02 |    3 |    23
 CORRIDA MORTAL        | AÇÃO    +| 2019-01-12 |    5 |    65
 CORRIDA MORTAL        | AÇÃO    +| 2019-03-08 |    1 |    43
 DRACULA               | SUSPENSE+| 2019-01-02 |   31 |    27 */

/* CRIA TABELA COM O RESULTADO DA QUERY ACIMA */
CREATE TABLE REL_LOCADORA AS
SELECT F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
    FROM GENERO G
        INNER JOIN FILME F
            ON G.IDGENERO = F.ID_GENERO
        INNER JOIN LOCACAO L
            ON L.ID_FILME = F.IDFILME;

SELECT * FROM REL_LOCADORA;

COPY REL_LOCADORA TO
'/tmp/REL_LOCADORA.csv'
DELIMITER ','
CSV HEADER;
