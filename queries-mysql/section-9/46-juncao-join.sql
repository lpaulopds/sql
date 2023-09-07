/*  JUNÇÃO -> JOIN */
    SELECT NOME, EMAIL, IDCLIENTE
        FROM CLIENTE;/*
    +---------+------------------+-----------+
    | NOME    | EMAIL            | IDCLIENTE |
    +---------+------------------+-----------+
    | JOAO    | JOAO@IG.COM.BR   |         1 |
    | CARLA   | CARLA@IG.COM.BR  |         5 |
    | MARIA   | MARIA@IG.COM.BR  |         6 |
    | CARLOS  | CARLOS@IG.COM.BR |         7 |
    | CELIA   | CELIA@IG.COM.BR  |         9 |
    | ARMANDO | NULL             |        10 |
    +---------+------------------+-----------+*/

    SELECT ID_CLIENTE, BAIRRO, CIDADE
        FROM ENDERECO;/*
    +------------+-----------+----------------+
    | ID_CLIENTE | BAIRRO    | CIDADE         |
    +------------+-----------+----------------+
    |          5 | CENTRO    | B. HORIZONTE   |
    |          6 | JARDINS   | RIO DE JANEIRO |
    |          9 | ESTACIO   | SAO PAULO      |
    |          7 | AMARALINA | ESPIRITO SANTO |
    |          1 | CENTRO    | SALVADOR       |
    |         10 | CENTRO    | CAMPINAS       |
    +------------+-----------+----------------+*/

    /*  NÃO UTILIZE ESTA QUERY EM PRODUÇÃO */
    /*  NOME, SEXO, BAIRRO, CIDADE */
    SELECT NOME, SEXO, BAIRRO, CIDADE
        FROM CLIENTE, ENDERECO
            WHERE IDCLIENTE = ID_CLIENTE;/*
    +---------+------+-----------+----------------+
    | NOME    | SEXO | BAIRRO    | CIDADE         |
    +---------+------+-----------+----------------+
    | JOAO    | M    | CENTRO    | SALVADOR       |
    | CARLA   | F    | CENTRO    | B. HORIZONTE   |
    | MARIA   | F    | JARDINS   | RIO DE JANEIRO |
    | CARLOS  | M    | AMARALINA | ESPIRITO SANTO |
    | CELIA   | F    | ESTACIO   | SAO PAULO      |
    | ARMANDO | M    | CENTRO    | CAMPINAS       |
    +---------+------+-----------+----------------+*/

/*  NÃO UTILIZE ESTA QUERY EM PRODUÇÃO */
    SELECT NOME, SEXO, BAIRRO, CIDADE
        FROM CLIENTE, ENDERECO
            WHERE IDCLIENTE = ID_CLIENTE
                AND SEXO = 'F';/*
    +-------+------+---------+----------------+
    | NOME  | SEXO | BAIRRO  | CIDADE         |
    +-------+------+---------+----------------+
    | CARLA | F    | CENTRO  | B. HORIZONTE   |
    | MARIA | F    | JARDINS | RIO DE JANEIRO |
    | CELIA | F    | ESTACIO | SAO PAULO      |
    +-------+------+---------+----------------+*/

/*  UTILIZE INNER JOIN PARA PROJETAR */
/*  OS DADOS DE DUAS TABELAS. */
    SELECT NOME, SEXO, BAIRRO, CIDADE
	FROM CLIENTE
            INNER JOIN ENDERECO
                ON IDCLIENTE = ID_CLIENTE;/*
    +---------+------+-----------+----------------+
    | NOME    | SEXO | BAIRRO    | CIDADE         |
    +---------+------+-----------+----------------+
    | JOAO    | M    | CENTRO    | SALVADOR       |
    | CARLA   | F    | CENTRO    | B. HORIZONTE   |
    | MARIA   | F    | JARDINS   | RIO DE JANEIRO |
    | CARLOS  | M    | AMARALINA | ESPIRITO SANTO |
    | CELIA   | F    | ESTACIO   | SAO PAULO      |
    | ARMANDO | M    | CENTRO    | CAMPINAS       |
    +---------+------+-----------+----------------+*/

    SELECT NOME, SEXO, BAIRRO, CIDADE
        FROM CLIENTE
            INNER JOIN ENDERECO ON IDCLIENTE = ID_CLIENTE
                WHERE SEXO = 'F';/*
    +-------+------+---------+----------------+
    | NOME  | SEXO | BAIRRO  | CIDADE         |
    +-------+------+---------+----------------+
    | CARLA | F    | CENTRO  | B. HORIZONTE   |
    | MARIA | F    | JARDINS | RIO DE JANEIRO |
    | CELIA | F    | ESTACIO | SAO PAULO      |
    +-------+------+---------+----------------+*/

/*  SEMPRE ESCREVA AS QUERY POR PARTES */
/*  projeção -> "origem" -> junção -> seleção */
    SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
        FROM CLIENTE
	    INNER JOIN TELEFONE
	        ON IDCLIENTE = ID_CLIENTE;/*
    +---------+------+------------------+------+------------+
    | NOME    | SEXO | EMAIL            | TIPO | NUMERO     |
    +---------+------+------------------+------+------------+
    | JOAO    | M    | JOAO@IG.COM.BR   | RES  | 3294332344 |
    | CARLA   | F    | CARLA@IG.COM.BR  | CEL  | 3294332344 |
    | CARLA   | F    | CARLA@IG.COM.BR  | CEL  | 9867345213 |
    | CARLA   | F    | CARLA@IG.COM.BR  | CEL  | 7609897634 |
    | MARIA   | F    | MARIA@IG.COM.BR  | DOM  | 3294332344 |
    | CARLOS  | M    | CARLOS@IG.COM.BR | RES  | 3294332344 |
    | CELIA   | F    | CELIA@IG.COM.BR  | DOM  | 3294332344 |
    | CELIA   | F    | CELIA@IG.COM.BR  | CEL  | 7689456354 |
    | ARMANDO | M    | NULL             | CEL  | 3294332344 |
    +---------+------+------------------+------+------------+*/

/*  Obs.: É NORMAL PROJETAR MAIS DE UM REGISTRO QUANDO A RELAÇÃO
    DAS TABELAS É 1xN. */
