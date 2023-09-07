/*  INSERT, UPDATE, DELTE - DML */
/*  NÃO É POSSÍVEL FAZER INSERT EM VIEW COM INNER JOIN */
    CREATE TABLE JOGADORES(
        IDJOGADOR INT,
        NOME VARCHAR(30),
        ESTADO CHAR(2)
    );

    INSERT INTO JOGADORES VALUES (1,'GUERRERO','RJ');
    INSERT INTO JOGADORES VALUES (2,'DESE','SP');
    INSERT INTO JOGADORES VALUES (3,'CAETÉ','AC');
    INSERT INTO JOGADORES VALUES (4,'OSCAR','MT');
    INSERT INTO JOGADORES VALUES (5,'AMARAL','BA');

    CREATE VIEW V_JOGADORES AS 
    SELECT NOME, ESTADO
        FROM JOGADORES;

    SELECT * FROM V_JOGADORES;

/*  É POSSÍVEL FAZER UPDATE EM VIEW COM JOIN */
    update v_relatorio
        set nome = 'JOSUALDO'
    where nome = 'ARMANDO'; 

    select * from cliente;/*
    +-----------+----------+------+-------------------+-------------+
    | idcliente | nome     | sexo | email             | cpf         |
    +-----------+----------+------+-------------------+-------------+
    |         1 | JOAO     | M    | JOAO@IG.COM.BR    | 11122233355 |
    |         2 | CARLA    | F    | CARLA@IG.COM.BR   | 11122233366 |
    |         3 | MARIA    | F    | MARIA@IG.COM.BR   | 11122233377 |
    |         4 | CARLOS   | M    | CARLOS@IG.COM.BR  | 11122233388 |
    |         5 | CELIA    | F    | CELIA@IG.COM.BR   | 11122233399 |
    |         6 | JOSUALDO | M    | NULL              | 22222233399 |
    |         7 | PAULA    | F    | NULL              | 33322233399 |
    |         8 | FLAVIO   | M    | FLAVIO@IG.COM     | 44477733322 |
    |         9 | ANDRE    | M    | ANDRE@GLOBO.COM   | 44422233399 |
    |        10 | GIOVANA  | F    | NULL              | 44477733333 |
    |        11 | KARLA    | F    | KARLA@GMAIL.COM   | 55522233399 |
    |        12 | DANIELE  | F    | DANIELE@GMAIL.COM | 66622233399 |
    |        13 | LORENA   | F    | NULL              | 77722233399 |
    |        14 | EDUARDO  | M    | NULL              | 44477733344 |
    |        15 | ANTONIO  | M    | ANTONIO@IG.COM    | 99933344455 |
    |        16 | ANTONIO  | M    | ANTONIO@UOL.COM   | 99933344466 |
    |        17 | ELAINE   | F    | ELAINE@GLOBO.COM  | 99933344400 |
    |        18 | CARMEM   | F    | CARMEM@IG.COM     | 99933344444 |
    |        19 | ADRIANA  | F    | ADRIANA@GMAIL.COM | 99933344422 |
    |        20 | JOICE    | F    | JOICE@GMAIL.COM   | 99933344433 |
    +-----------+----------+------+-------------------+-------------+*/

/*  É POSSÍVEL FAZER DELETE NUMA VIEW SEM JOIN */
    DELETE FROM V_JOGADORES
        WHERE NOME = 'GUERRERO';

/*  É POSSÍVEL FAZER INSERT NUMA VIEW SEM JOIN */
    INSERT INTO V_JOGADORES
        VALUES ('GUERRERO', 'RS');

/*  É POSSÍVEL FAZER SELECT NUMA VIEW COM JOIN */
    select * from v_relatorio
    where sexo = 'F';/*
    +---------+------+-------------------+------+----------+------------+----------------+--------+
    | nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
    +---------+------+-------------------+------+----------+------------+----------------+--------+
    | CARLA   | F    | CARLA@IG.COM.BR   | RES  | 11223344 | JARDINS    | RIO DE JANEIRO | RJ     |
    | MARIA   | F    | MARIA@IG.COM.BR   | COM  | 11223344 | ESTACIO    | SAO PAULO      | SP     |
    | CELIA   | F    | CELIA@IG.COM.BR   | COM  | 11223344 | CENTRO     | SALVADOR       | BA     |
    | PAULA   | F    | ***@***.***       | CEL  | 11223344 | AVENIDA    | CURITIBA       | MT     |
    | KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | KARLA   | F    | KARLA@GMAIL.COM   | COM  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | DANIELE | F    | DANIELE@GMAIL.COM | COM  | 11223344 | COPACABANA | RIO DE JANEIRO | RJ     |
    | LORENA  | F    | ***@***.***       | COM  | 11223344 | CENTRO     | VITORIA        | ES     |
    | ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 11223344 | BOM RETIRO | CURITIBA       | PR     |
    | CARMEM  | F    | CARMEM@IG.COM     | RES  | 11223344 | LAPA       | SAO PAULO      | SP     |
    | ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | JOICE   | F    | JOICE@GMAIL.COM   | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | JOICE   | F    | JOICE@GMAIL.COM   | COM  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    +---------+------+-------------------+------+----------+------------+----------------+--------+*/
