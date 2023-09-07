/*  ORDER BY */
    CREATE TABLE ALUNOS(
        NUMERO INT,
        NOME VARCHAR(30)
    );

    INSERT INTO ALUNOS VALUES (1,'JOAO');
    INSERT INTO ALUNOS VALUES (1,'MARIA');
    INSERT INTO ALUNOS VALUES (2,'ZOE');
    INSERT INTO ALUNOS VALUES (2,'ANDRE');
    INSERT INTO ALUNOS VALUES (3,'CLARA');
    INSERT INTO ALUNOS VALUES (1,'CLARA');
    INSERT INTO ALUNOS VALUES (4,'MARIA');
    INSERT INTO ALUNOS VALUES (5,'JANAINA');
    INSERT INTO ALUNOS VALUES (1,'JANAINA');
    INSERT INTO ALUNOS VALUES (3,'MARCELO');
    INSERT INTO ALUNOS VALUES (4,'GIOVANI');
    INSERT INTO ALUNOS VALUES (5,'ANTONIO');
    INSERT INTO ALUNOS VALUES (6,'JOANA');
    INSERT INTO ALUNOS VALUES (6,'VIVIANE');

    SELECT * FROM ALUNOS
        ORDER BY NUMERO;

/*  COLUNA 1 */
    SELECT * FROM ALUNOS
        ORDER BY 1;

/*  COLUNA 2 */
    SELECT * FROM ALUNOS
        ORDER BY 2;

/*  ORDENANDO POR MAIS DE UMA COLUNA */
SELECT * FROM ALUNOS
    ORDER BY 1;

    SELECT * FROM ALUNOS
        ORDER BY NUMERO, NOME;

    SELECT * FROM ALUNOS
        ORDER BY 1, 2;

/*  MESCLANDO ORDER BY COM PROJEÇÃO */
    SELECT NOME FROM ALUNOS
        ORDER BY 1, 2;

    SELECT NOME FROM ALUNOS
        ORDER BY NUMERO, NOME;

/*  ORDER BY DESC / ASC */
    SELECT * FROM ALUNOS
        ORDER BY 1, 2;

    SELECT * FROM ALUNOS
        ORDER BY 1 ASC;

	SELECT * FROM ALUNOS
	    ORDER BY 1 DESC;

    SELECT * FROM ALUNOS
        ORDER BY 1, 2 DESC;

    SELECT * FROM ALUNOS
        ORDER BY 1 DESC, 2 DESC;/*
    +--------+---------+
    | NUMERO | NOME    |
    +--------+---------+
    |      6 | VIVIANE |
    |      6 | JOANA   |
    |      5 | JANAINA |
    |      5 | ANTONIO |
    |      4 | MARIA   |
    |      4 | GIOVANI |
    |      3 | MARCELO |
    |      3 | CLARA   |
    |      2 | ZOE     |
    |      2 | ANDRE   |
    |      1 | MARIA   |
    |      1 | JOAO    |
    |      1 | JANAINA |
    |      1 | CLARA   |
    +--------+---------+*/

/*  ORDENANDO COM JOINS */
    select  c.nome,
            c.sexo,
            ifnull(c.email,'***@***.***') as email,
            t.tipo,
            t.numero,
            e.bairro,
            e.cidade,
            e.estado
            from cliente c 
                inner join telefone t 
                    on c.idcliente = t.id_cliente
                inner join endereco e 
                    on c.idcliente = e.id_cliente
            order by 1;/*
    +----------+------+-------------------+------+----------+------------+----------------+--------+
    | nome     | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
    +----------+------+-------------------+------+----------+------------+----------------+--------+
    | ADRIANA  | F    | ADRIANA@GMAIL.COM | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | ADRIANA  | F    | ADRIANA@GMAIL.COM | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | ANDRE    | M    | ANDRE@GLOBO.COM   | RES  | 11223344 | CASCADURA  | B. HORIZONTE   | MG     |
    | ANDRE    | M    | ANDRE@GLOBO.COM   | CEL  | 11223344 | CASCADURA  | B. HORIZONTE   | MG     |
    | ANTONIO  | M    | ANTONIO@UOL.COM   | COM  | 11223344 | JARDINS    | SAO PAULO      | SP     |
    | ANTONIO  | M    | ANTONIO@IG.COM    | CEL  | 11223344 | CENTRO     | CURITIBA       | PR     |
    | CARLA    | F    | CARLA@IG.COM.BR   | RES  | 11223344 | JARDINS    | RIO DE JANEIRO | RJ     |
    | CARLOS   | M    | CARLOS@IG.COM.BR  | RES  | 11223344 | AMARALINA  | ESPIRITO SANTO | ES     |
    | CARMEM   | F    | CARMEM@IG.COM     | RES  | 11223344 | LAPA       | SAO PAULO      | SP     |
    | CELIA    | F    | CELIA@IG.COM.BR   | COM  | 11223344 | CENTRO     | SALVADOR       | BA     |
    | DANIELE  | F    | DANIELE@GMAIL.COM | COM  | 11223344 | COPACABANA | RIO DE JANEIRO | RJ     |
    | ELAINE   | F    | ELAINE@GLOBO.COM  | CEL  | 11223344 | BOM RETIRO | CURITIBA       | PR     |
    | JOAO     | M    | JOAO@IG.COM.BR    | CEL  | 11223344 | CENTRO     | B. HORIZONTE   | MG     |
    | JOICE    | F    | JOICE@GMAIL.COM   | COM  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | JOICE    | F    | JOICE@GMAIL.COM   | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | JOSUALDO | M    | ***@***.***       | CEL  | 11223344 | CENTRO     | CAMPINAS       | MT     |
    | KARLA    | F    | KARLA@GMAIL.COM   | COM  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | KARLA    | F    | KARLA@GMAIL.COM   | CEL  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | KARLA    | F    | KARLA@GMAIL.COM   | CEL  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | LORENA   | F    | ***@***.***       | COM  | 11223344 | CENTRO     | VITORIA        | ES     |
    | MARIA    | F    | MARIA@IG.COM.BR   | COM  | 11223344 | ESTACIO    | SAO PAULO      | SP     |
    | PAULA    | F    | ***@***.***       | CEL  | 11223344 | AVENIDA    | CURITIBA       | MT     |
    +----------+------+-------------------+------+----------+------------+----------------+--------+*/

/*  ORDENAR VIEWS */
    SELECT * FROM v_relatorio
        ORDER BY 1;
