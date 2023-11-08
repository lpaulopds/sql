/* SINCRONIZANDO TABELAS E RELATÓRIOS */

DROP TABLE LOCACAO;

CREATE TABLE LOCACAO(
	IDLOCACAO INT PRIMARY KEY,
	DATA TIMESTAMP,
	MIDIA INT,
	DIAS INT,
	ID_FILME INT,
	FOREIGN KEY(ID_FILME)
	REFERENCES FILME(IDFILME)
);

CREATE SEQUENCE SEQ_LOCACAO;

NEXTVAL('SEQ_LOCACAO');

INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/08/2018',23,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',56,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/07/2018',23,3,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/02/2018',43,1,500);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'02/02/2018',23,2,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/07/2018',76,3,700);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/02/2018',45,1,700);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/08/2018',89,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/02/2018',23,3,800);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'05/07/2018',23,3,500);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'05/02/2018',38,3,800);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/10/2018',56,1,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'06/12/2018',23,3,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',56,2,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'04/10/2018',76,3,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/09/2018',32,2,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'08/02/2018',89,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',23,1,200);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'08/09/2018',45,3,300);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2018',89,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/07/2018',23,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2018',21,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',34,2,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/08/2018',67,1,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',76,3,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',66,3,200);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'09/12/2018',90,1,400);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/02/2018',23,3,100);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/12/2018',65,5,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'03/08/2018',43,1,1000);
INSERT INTO LOCACAO VALUES(NEXTVAL('SEQ_LOCACAO'),'01/02/2018',27,31,200);

SELECT * FROM LOCACAO;	
SELECT * FROM GENERO;
SELECT * FROM FILME;
SELECT * FROM REL_LOCADORA;

SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
    FROM GENERO G
        INNER JOIN FILME F
            ON G.IDGENERO = F.ID_GENERO
        INNER JOIN LOCACAO L
            ON L.ID_FILME = F.IDFILME;
/*
 idlocacao |         filme         |  genero  |        data         | dias | midia 
-----------+-----------------------+----------+---------------------+------+-------
         1 | KILL BILL I           | AVENTURA+| 2018-01-08 00:00:00 |    3 |    23
         2 | UM SONHO DE LIBERDADE | DRAMA    | 2018-01-02 00:00:00 |    1 |    56
         3 | UM SONHO DE LIBERDADE | DRAMA    | 2018-02-07 00:00:00 |    3 |    23
         4 | OS BAD BOYS           | AÇÃO  +  | 2018-02-02 00:00:00 |    1 |    43
         5 | KILL BILL I           | AVENTURA+| 2018-02-02 00:00:00 |    2 |    23
         6 | CADILLAC RECORDS      | DRAMA    | 2018-03-07 00:00:00 |    3 |    76
         7 | CADILLAC RECORDS      | DRAMA    | 2018-03-02 00:00:00 |    1 |    45
         8 | KILL BILL I           | AVENTURA+| 2018-04-08 00:00:00 |    3 |    89
         9 | O HOBBIT              | FANTASIA+| 2018-04-02 00:00:00 |    3 |    23
        10 | OS BAD BOYS           | AÇÃO  +  | 2018-05-07 00:00:00 |    3 |    23
        11 | O HOBBIT              | FANTASIA+| 2018-05-02 00:00:00 |    3 |    38
        12 | KILL BILL I           | AVENTURA+| 2018-01-10 00:00:00 |    1 |    56
        13 | UM SONHO DE LIBERDADE | DRAMA    | 2018-06-12 00:00:00 |    3 |    23
        14 | SENHOR DOS ANEIS      | FANTASIA+| 2018-01-02 00:00:00 |    2 |    56
        15 | SENHOR DOS ANEIS      | FANTASIA+| 2018-04-10 00:00:00 |    3 |    76
        16 | UM SONHO DE LIBERDADE | DRAMA    | 2018-01-09 00:00:00 |    2 |    32
        17 | KILL BILL I           | AVENTURA+| 2018-08-02 00:00:00 |    3 |    89
        18 | DRACULA               | SUSPENSE+| 2018-01-02 00:00:00 |    1 |    23
        19 | SENHOR DOS ANEIS      | FANTASIA+| 2018-08-09 00:00:00 |    3 |    45
        20 | UM SONHO DE LIBERDADE | DRAMA    | 2018-01-12 00:00:00 |    1 |    89
        21 | CORRIDA MORTAL        | AÇÃO  +  | 2018-09-07 00:00:00 |    3 |    23
        22 | CORRIDA MORTAL        | AÇÃO  +  | 2018-01-12 00:00:00 |    3 |    21
        23 | KILL BILL I           | AVENTURA+| 2018-01-02 00:00:00 |    2 |    34
        24 | CORRIDA MORTAL        | AÇÃO  +  | 2018-09-08 00:00:00 |    1 |    67
        25 | CORRIDA MORTAL        | AÇÃO  +  | 2018-01-02 00:00:00 |    3 |    76
        26 | DRACULA               | SUSPENSE+| 2018-01-02 00:00:00 |    3 |    66
        27 | UM SONHO DE LIBERDADE | DRAMA    | 2018-09-12 00:00:00 |    1 |    90
        28 | KILL BILL I           | AVENTURA+| 2018-03-02 00:00:00 |    3 |    23
        29 | CORRIDA MORTAL        | AÇÃO  +  | 2018-01-12 00:00:00 |    5 |    65
        30 | CORRIDA MORTAL        | AÇÃO  +  | 2018-03-08 00:00:00 |    1 |    43
        31 | DRACULA               | SUSPENSE+| 2018-01-02 00:00:00 |   31 |    27 */

/* CRIA TABELA COM VALOR DE SELECT */
CREATE TABLE RELATORIO_LOCADORA AS
SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
    FROM GENERO G
        INNER JOIN FILME F
            ON G.IDGENERO = F.ID_GENERO
        INNER JOIN LOCACAO L
            ON L.ID_FILME = F.IDFILME;

SELECT * FROM RELATORIO_LOCADORA;
SELECT * FROM LOCACAO;

SELECT MAX(IDLOCACAO) AS RELATORIO, (SELECT MAX(IDLOCACAO) FROM LOCACAO AS LOCACAO)
    FROM RELATORIO_LOCADORA;
/*
 relatorio | max 
-----------+-----
        31 |  31 */

SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
    FROM GENERO G
        INNER JOIN FILME F
            ON G.IDGENERO = F.ID_GENERO
        INNER JOIN LOCACAO L
            ON L.ID_FILME = F.IDFILME
        WHERE IDLOCACAO NOT IN (SELECT IDLOCACAO FROM RELATORIO_LOCADORA);
/*
 idlocacao | filme | genero | data | dias | midia 
-----------+-------+--------+------+------+-------
(0 rows) */

/* INSERINDO REGISTROS NOVOS */
INSERT INTO RELATORIO_LOCADORA
SELECT L.IDLOCACAO, F.NOME AS FILME, G.NOME AS GENERO, L.DATA AS DATA, L.DIAS AS DIAS, L.MIDIA AS MIDIA
    FROM GENERO G
        INNER JOIN FILME F
            ON G.IDGENERO = F.ID_GENERO
        INNER JOIN LOCACAO L
            ON L.ID_FILME = F.IDFILME
        WHERE IDLOCACAO NOT IN (SELECT IDLOCACAO FROM RELATORIO_LOCADORA);
/*
INSERT 0 0 */

SELECT MAX(IDLOCACAO) AS RELATORIO, (SELECT MAX(IDLOCACAO) FROM LOCACAO AS LOCACAO)
    FROM RELATORIO_LOCADORA;
/*
 relatorio | max 
-----------+-----
        31 |  31 */
