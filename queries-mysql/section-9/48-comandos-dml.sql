/*  CATEGORIAS DE LINGUAGEM */
/*  DML - DATA MANIPULATION LANGUAGE  */
/*  DDL - DATA DEFINITION LANGUAGE */
/*  DCL - DATA CONTROL LANGUAGE */
/*  TCL - TRANSACTION CONTROL - LANGUAGE */

/*  INSERT */ 
    INSERT INTO CLIENTE
        VALUES(NULL, 'PAULA', 'M', NULL, 9865764543);

    INSERT INTO ENDERECO
        VALUES(NULL, 'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',11);

/*  FILTRO */
    SELECT * FROM CLIENTE
        WHERE SEXO = 'M';/*
    +-----------+---------+------+------------------+-------------+
    | IDCLIENTE | NOME    | SEXO | EMAIL            | CPF         |
    +-----------+---------+------+------------------+-------------+
    |         1 | JOAO    | M    | JOAO@IG.COM.BR   | 12334542332 |
    |         7 | CARLOS  | M    | CARLOS@IG.COM.BR | 12334987332 |
    |        10 | ARMANDO | M    | NULL             | 55334542300 |
    |        11 | PAULA   | M    | NULL             | 9865764543  |
    +-----------+---------+------+------------------+-------------+*/

/*  UPDATE */ 
    SELECT * FROM CLIENTE
        WHERE IDCLIENTE = 11;/*
    +-----------+-------+------+-------+------------+
    | IDCLIENTE | NOME  | SEXO | EMAIL | CPF        |
    +-----------+-------+------+-------+------------+
    |        11 | PAULA | M    | NULL  | 9865764543 |
    +-----------+-------+------+-------+------------+*/

    UPDATE CLIENTE
        SET SEXO = 'F'
    WHERE IDCLIENTE = 11;
    
    SELECT * FROM CLIENTE
        WHERE IDCLIENTE = 11;/*
    +-----------+-------+------+-------+------------+
    | IDCLIENTE | NOME  | SEXO | EMAIL | CPF        |
    +-----------+-------+------+-------+------------+
    |        11 | PAULA | F    | NULL  | 9865764543 |
    +-----------+-------+------+-------+------------+*/
    
/*  DELETE*/
    INSERT INTO CLIENTE
        VALUES(NULL, 'XXX', 'M', NULL, 'XXX');

    SELECT * FROM CLIENTE
        WHERE IDCLIENTE = 12;/*
    +-----------+------+------+-------+------+
    | IDCLIENTE | NOME | SEXO | EMAIL | CPF  |
    +-----------+------+------+-------+------+
    |        12 | XXX  | M    | NULL  | XXX  |
    +-----------+------+------+-------+------+*/

    DELETE FROM CLIENTE
        WHERE IDCLIENTE = 12;
