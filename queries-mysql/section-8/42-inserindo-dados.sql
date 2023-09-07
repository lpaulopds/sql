/*  QUERYS */
    INSERT INTO CLIENTE
        VALUES(NULL,'JOAO','M','JOAO@IG.COM.BR','12334542332');
    
    INSERT INTO CLIENTE
        VALUES(NULL,'CARLA','F','CARLA@IG.COM.BR','12334387632');
    
    INSERT INTO CLIENTE
        VALUES(NULL,'MARIA','F','MARIA@IG.COM.BR','12312342332');
    
    INSERT INTO CLIENTE
        VALUES(NULL,'CARLOS','M','CARLOS@IG.COM.BR','12334987332');
    
    INSERT INTO CLIENTE
        VALUES(NULL,'CELIA','F','CELIA@IG.COM.BR','12334542300');
    
    INSERT INTO CLIENTE
        VALUES(NULL,'ARMANDO','M',NULL,'55334542300');

    SELECT * FROM CLIENTE;/*
    +-----------+---------+------+------------------+-------------+
    | IDCLIENTE | NOME    | SEXO | EMAIL            | CPF         |
    +-----------+---------+------+------------------+-------------+
    |         1 | JOAO    | M    | JOAO@IG.COM.BR   | 12334542332 |
    |         5 | CARLA   | F    | CARLA@IG.COM.BR  | 12334387632 |
    |         6 | MARIA   | F    | MARIA@IG.COM.BR  | 12312342332 |
    |         7 | CARLOS  | M    | CARLOS@IG.COM.BR | 12334987332 |
    |         9 | CELIA   | F    | CELIA@IG.COM.BR  | 12334542300 |
    |        10 | ARMANDO | M    | NULL             | 55334542300 |
    +-----------+---------+------+------------------+-------------+*/

    DESC ENDERECO;/*
    +------------+-------------+------+-----+---------+----------------+
    | Field      | Type        | Null | Key | Default | Extra          |
    +------------+-------------+------+-----+---------+----------------+
    | IDENDERECO | int         | NO   | PRI | NULL    | auto_increment |
    | RUA        | varchar(30) | NO   |     | NULL    |                |
    | BAIRRO     | varchar(30) | NO   |     | NULL    |                |
    | CIDADE     | varchar(30) | NO   |     | NULL    |                |
    | ESTADO     | char(2)     | NO   |     | NULL    |                |
    | ID_CLIENTE | int         | YES  | UNI | NULL    |                |
    +------------+-------------+------+-----+---------+----------------+*/

    INSERT INTO ENDERECO
        VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',5);

    INSERT INTO ENDERECO
        VALUES(NULL,'RUA CAPITAO HERMES','JARDINS','RIO DE JANEIRO','RJ',6);

    INSERT INTO ENDERECO
        VALUES(NULL,'RUA PRES VARGAS','ESTACIO','SAO PAULO','SP',9);

    INSERT INTO ENDERECO
        VALUES(NULL,'RUA ALFANDEGA','AMARALINA','ESPIRITO SANTO','ES',7);

    INSERT INTO ENDERECO
        VALUES(NULL,'RUA DO OUVIDOR','CENTRO','SALVADOR','BA',1);

    INSERT INTO ENDERECO
        VALUES(NULL,'RUA URUGUAIANA','CENTRO','CAMPINAS','MT',10);

    SELECT * FROM  ENDERECO;/*
    +------------+--------------------+-----------+----------------+--------+------------+
    | IDENDERECO | RUA                | BAIRRO    | CIDADE         | ESTADO | ID_CLIENTE |
    +------------+--------------------+-----------+----------------+--------+------------+
    |          1 | RUA ANTONIO SA     | CENTRO    | B. HORIZONTE   | MG     |          5 |
    |          2 | RUA CAPITAO HERMES | JARDINS   | RIO DE JANEIRO | RJ     |          6 |
    |          3 | RUA PRES VARGAS    | ESTACIO   | SAO PAULO      | SP     |          9 |
    |          4 | RUA ALFANDEGA      | AMARALINA | ESPIRITO SANTO | ES     |          7 |
    |          5 | RUA DO OUVIDOR     | CENTRO    | SALVADOR       | BA     |          1 |
    |          6 | RUA URUGUAIANA     | CENTRO    | CAMPINAS       | MT     |         10 |
    +------------+--------------------+-----------+----------------+--------+------------+*/
