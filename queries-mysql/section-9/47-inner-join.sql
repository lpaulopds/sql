/*  NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */
/*  error */
    SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
        FROM CLIENTE
    	    INNER JOIN ENDERECO
    	        ON IDCLIENTE = ID_CLIENTE
    	    INNER JOIN TELEFONE
    	        ON IDCLIENTE = ID_CLIENTE;

/*  error */
    SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
        FROM CLIENTE
    	    INNER JOIN ENDERECO, TELEFONE
    	        ON IDCLIENTE = ID_CLIENTE

/*  error */
    SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
        FROM CLIENTE
    	    INNER JOIN ENDERECO
    	        ON IDCLIENTE = ID_CLIENTE
    	    INNER JOIN TELEFONE
    	        ON IDCLIENTE = ID_CLIENTE;

/*  error */
    SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
        FROM CLIENTE
    	    INNER JOIN ENDERECO AND INNER JOIN TELEFONE
    	        ON IDCLIENTE = ID_CLIENTE;

    SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
        FROM CLIENTE
    	    INNER JOIN ENDERECO
	        ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	    INNER JOIN TELEFONE
	        ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;/*
    +---------+------+-----------+----------------+------+------------+
    | NOME    | SEXO | BAIRRO    | CIDADE         | TIPO | NUMERO     |
    +---------+------+-----------+----------------+------+------------+
    | CARLA   | F    | CENTRO    | B. HORIZONTE   | CEL  | 3294332344 |
    | JOAO    | M    | CENTRO    | SALVADOR       | RES  | 3294332344 |
    | CARLOS  | M    | AMARALINA | ESPIRITO SANTO | RES  | 3294332344 |
    | ARMANDO | M    | CENTRO    | CAMPINAS       | CEL  | 3294332344 |
    | MARIA   | F    | JARDINS   | RIO DE JANEIRO | DOM  | 3294332344 |
    | CELIA   | F    | ESTACIO   | SAO PAULO      | DOM  | 3294332344 |
    | CARLA   | F    | CENTRO    | B. HORIZONTE   | CEL  | 9867345213 |
    | CARLA   | F    | CENTRO    | B. HORIZONTE   | CEL  | 7609897634 |
    | CELIA   | F    | ESTACIO   | SAO PAULO      | CEL  | 7689456354 |
    +---------+------+-----------+----------------+------+------------+*/

    SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
        FROM CLIENTE C
	    INNER JOIN ENDERECO E
	        ON C.IDCLIENTE = E.ID_CLIENTE
	    INNER JOIN TELEFONE T
	        ON C.IDCLIENTE = T.ID_CLIENTE;/*
    +---------+------+-----------+----------------+------+------------+
    | NOME    | SEXO | BAIRRO    | CIDADE         | TIPO | NUMERO     |
    +---------+------+-----------+----------------+------+------------+
    | JOAO    | M    | CENTRO    | SALVADOR       | RES  | 3294332344 |
    | CARLA   | F    | CENTRO    | B. HORIZONTE   | CEL  | 3294332344 |
    | CARLA   | F    | CENTRO    | B. HORIZONTE   | CEL  | 9867345213 |
    | CARLA   | F    | CENTRO    | B. HORIZONTE   | CEL  | 7609897634 |
    | MARIA   | F    | JARDINS   | RIO DE JANEIRO | DOM  | 3294332344 |
    | CARLOS  | M    | AMARALINA | ESPIRITO SANTO | RES  | 3294332344 |
    | CELIA   | F    | ESTACIO   | SAO PAULO      | DOM  | 3294332344 |
    | CELIA   | F    | ESTACIO   | SAO PAULO      | CEL  | 7689456354 |
    | ARMANDO | M    | CENTRO    | CAMPINAS       | CEL  | 3294332344 |
    +---------+------+-----------+----------------+------+------------+*/
