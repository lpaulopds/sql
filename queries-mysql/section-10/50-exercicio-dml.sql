/*  EXERCICIO DML */

/*  select c.nome, c.email, t.numero              -> projeção
      from cliente c                              -> "origem"
          inner join endereco e                   -> junção
              on c.idcliente = e.id_cliente       -> junção condição
          inner join telefone t                   -> junção
              on c.idcliente = t.id_cliente       -> junção condição
      where sexo = 'M'                            -> seleção
          or sexo = 'F';                          -> seleção */

/*  RELATORIO GERAL DE TODOS OS CLIENTES */
/*  RELATORIO GERAL DE E-MAILS E TELEFONES DE TODOS OS CLIENTE */

/*  DESCRIÇÃO DAS TABELAS */
    desc cliente;/*
    +-----------+---------------+------+-----+---------+----------------+
    | Field     | Type          | Null | Key | Default | Extra          |
    +-----------+---------------+------+-----+---------+----------------+
    | idcliente | int           | NO   | PRI | NULL    | auto_increment |
    | nome      | varchar(30)   | NO   |     | NULL    |                |
    | sexo      | enum('M','F') | NO   |     | NULL    |                |
    | email     | varchar(50)   | YES  | UNI | NULL    |                |
    | cpf       | varchar(15)   | YES  | UNI | NULL    |                |
    +-----------+---------------+------+-----+---------+----------------+*/

    desc endereco;/*
    +------------+-------------+------+-----+---------+----------------+
    | Field      | Type        | Null | Key | Default | Extra          |
    +------------+-------------+------+-----+---------+----------------+
    | idendereco | int         | NO   | PRI | NULL    | auto_increment |
    | rua        | varchar(30) | NO   |     | NULL    |                |
    | bairro     | varchar(30) | NO   |     | NULL    |                |
    | cidade     | varchar(30) | NO   |     | NULL    |                |
    | estado     | char(2)     | NO   |     | NULL    |                |
    | id_cliente | int         | YES  | UNI | NULL    |                |
    +------------+-------------+------+-----+---------+----------------+*/

    desc telefone;/*
    +------------+-------------------------+------+-----+---------+----------------+
    | Field      | Type                    | Null | Key | Default | Extra          |
    +------------+-------------------------+------+-----+---------+----------------+
    | idtelefone | int                     | NO   | PRI | NULL    | auto_increment |
    | tipo       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
    | numero     | varchar(10)             | NO   |     | NULL    |                |
    | id_cliente | int                     | YES  | MUL | NULL    |                |
    +------------+-------------------------+------+-----+---------+----------------+*/

/*  TODOS OS DADOS DOS CLIENTE CADASTRADOS NO BANCO DE DADOS COMERCIO */
    select c.idcliente, c.nome, c.sexo, c.email, c.cpf, e.rua, e.bairro, e.cidade, e.estado, t.tipo, t.numero
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente;/*
    +---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+------------+
    | nome    | sexo | email             | cpf         | rua                | bairro     | cidade         | estado | tipo | numero     |
    +---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+------------+
    | JOAO    | M    | JOAO@IG.COM.BR    | 11122233355 | RUA ANTONIO SA     | CENTRO     | B. HORIZONTE   | MG     | CEL  | 3294332344 |
    | CARLA   | F    | CARLA@IG.COM.BR   | 11122233366 | RUA CAPITAO HERMES | JARDINS    | RIO DE JANEIRO | RJ     | RES  | 3294332344 |
    | MARIA   | F    | MARIA@IG.COM.BR   | 11122233377 | RUA PRES VARGAS    | ESTACIO    | SAO PAULO      | SP     | COM  | 3294332344 |
    | CARLOS  | M    | CARLOS@IG.COM.BR  | 11122233388 | RUA ALFANDEGA      | AMARALINA  | ESPIRITO SANTO | ES     | RES  | 3294332344 |
    | CELIA   | F    | CELIA@IG.COM.BR   | 11122233399 | RUA DO OUVIDOR     | CENTRO     | SALVADOR       | BA     | COM  | 3294332344 |
    | ARMANDO | M    | NULL              | 22222233399 | RUA URUGUAIANA     | CENTRO     | CAMPINAS       | MT     | CEL  | 3294332344 |
    | PAULA   | F    | NULL              | 33322233399 | RUA URUGUAIANA     | AVENIDA    | CURITIBA       | MT     | CEL  | 3294332344 |
    | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565   |
    | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675   |
    | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765   |
    | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786   |
    | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654   |
    | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979   |
    | LORENA  | M    | NULL              | 774557887   | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676   |
    | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809   |
    | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978   |
    | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768   |
    | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665   |
    | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786   |
    | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554   |
    | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785   |
    | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578   |
    +---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+------------+*/
/*  PROJEÇÃO E JUNÇÃO PONTILHADA */

    select c.nome, c.email, t.numero
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'M'
            or sexo = 'F';/*
    +---------+-------------------+------------+
    | nome    | email             | numero     |
    +---------+-------------------+------------+
    | JOAO    | JOAO@IG.COM.BR    | 3294332344 |
    | CARLA   | CARLA@IG.COM.BR   | 3294332344 |
    | MARIA   | MARIA@IG.COM.BR   | 3294332344 |
    | CARLOS  | CARLOS@IG.COM.BR  | 3294332344 |
    | CELIA   | CELIA@IG.COM.BR   | 3294332344 |
    | ARMANDO | NULL              | 3294332344 |
    | PAULA   | NULL              | 3294332344 |
    | ANDRE   | ANDRE@GLOBO.COM   | 68976565   |
    | ANDRE   | ANDRE@GLOBO.COM   | 99656675   |
    | KARLA   | KARLA@GMAIL.COM   | 33567765   |
    | KARLA   | KARLA@GMAIL.COM   | 88668786   |
    | KARLA   | KARLA@GMAIL.COM   | 55689654   |
    | DANIELE | DANIELE@GMAIL.COM | 88687979   |
    | LORENA  | NULL              | 88965676   |
    | ANTONIO | ANTONIO@IG.COM    | 89966809   |
    | ANTONIO | ANTONIO@UOL.COM   | 88679978   |
    | ELAINE  | ELAINE@GLOBO.COM  | 99655768   |
    | CARMEM  | CARMEM@IG.COM     | 89955665   |
    | ADRIANA | ADRIANA@GMAIL.COM | 77455786   |
    | ADRIANA | ADRIANA@GMAIL.COM | 89766554   |
    | JOICE   | JOICE@GMAIL.COM   | 77755785   |
    | JOICE   | JOICE@GMAIL.COM   | 44522578   |
    +---------+-------------------+------------+*/
/*  PROJEÇÃO E JUNÇÃO PONTILHADA COM SELEÇÃO POR SEXO 'M' 'F' */

    select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
           e.rua, e.bairro, e.cidade, e.estado,
           t.tipo, t.numero
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'M';
    /* TABELA COM INSERÇÕES ERRADAS NA COLUNA SEXO *//*
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
    | idcliente | nome    | sexo | email             | cpf         | rua                | bairro     | cidade         | estado | tipo | numero   |
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
    |         1 | JOAO    | M    | JOAO@IG.COM.BR    | 11122233355 | RUA ANTONIO SA     | CENTRO     | B. HORIZONTE   | MG     | CEL  | 11223344 |
    |         4 | CARLOS  | M    | CARLOS@IG.COM.BR  | 11122233388 | RUA ALFANDEGA      | AMARALINA  | ESPIRITO SANTO | ES     | RES  | 11223344 |
    |         6 | ARMANDO | M    | NULL              | 22222233399 | RUA URUGUAIANA     | CENTRO     | CAMPINAS       | MT     | CEL  | 11223344 |
    |         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 44422233399 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 11223344 |
    |         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 44422233399 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 11223344 |
    |        11 | KARLA   | M    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 11223344 |
    |        11 | KARLA   | M    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 11223344 |
    |        11 | KARLA   | M    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 11223344 |
    |        12 | DANIELE | M    | DANIELE@GMAIL.COM | 66622233399 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 11223344 |
    |        13 | LORENA  | M    | NULL              | 77722233399 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 11223344 |
    |        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 99933344466 | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 11223344 |
    |        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 99933344400 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 11223344 |
    |        18 | CARMEM  | M    | CARMEM@IG.COM     | 99933344444 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 11223344 |
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+*/

/*  CORRIGINDO COLUNA SEXO */
    select * from cliente
        where idcliente = 11
            or idcliente = 12
            or idcliente = 13
            or idcliente = 17
            or idcliente = 18;/*
    +-----------+---------+------+-------------------+-------------+
    | idcliente | nome    | sexo | email             | cpf         |
    +-----------+---------+------+-------------------+-------------+
    |        11 | KARLA   | M    | KARLA@GMAIL.COM   | 55522233399 |
    |        12 | DANIELE | M    | DANIELE@GMAIL.COM | 66622233399 |
    |        13 | LORENA  | M    | NULL              | 77722233399 |
    |        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 99933344400 |
    |        18 | CARMEM  | M    | CARMEM@IG.COM     | 99933344444 |
    +-----------+---------+------+-------------------+-------------+*/

    update cliente set sexo = 'F'
        where idcliente in (11,12,13,17,18);/*
    +-----------+---------+------+-------------------+-------------+
    | idcliente | nome    | sexo | email             | cpf         |
    +-----------+---------+------+-------------------+-------------+
    |        11 | KARLA   | F    | KARLA@GMAIL.COM   | 55522233399 |
    |        12 | DANIELE | F    | DANIELE@GMAIL.COM | 66622233399 |
    |        13 | LORENA  | F    | NULL              | 77722233399 |
    |        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 99933344400 |
    |        18 | CARMEM  | F    | CARMEM@IG.COM     | 99933344444 |
    +-----------+---------+------+-------------------+-------------+*/

/*  PRINCIPAIS DADOS MULHERES CLIENTES */
    select c.idcliente, c.nome, c.sexo, c.email, c.cpf, e.rua, e.bairro, e.cidade, e.estado, t.tipo, t.numero
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F';/*
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
    | idcliente | nome    | sexo | email             | cpf         | rua                | bairro     | cidade         | estado | tipo | numero   |
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
    |         2 | CARLA   | F    | CARLA@IG.COM.BR   | 11122233366 | RUA CAPITAO HERMES | JARDINS    | RIO DE JANEIRO | RJ     | RES  | 11223344 |
    |         3 | MARIA   | F    | MARIA@IG.COM.BR   | 11122233377 | RUA PRES VARGAS    | ESTACIO    | SAO PAULO      | SP     | COM  | 11223344 |
    |         5 | CELIA   | F    | CELIA@IG.COM.BR   | 11122233399 | RUA DO OUVIDOR     | CENTRO     | SALVADOR       | BA     | COM  | 11223344 |
    |         7 | PAULA   | F    | NULL              | 33322233399 | RUA URUGUAIANA     | AVENIDA    | CURITIBA       | MT     | CEL  | 11223344 |
    |        11 | KARLA   | F    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 11223344 |
    |        11 | KARLA   | F    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 11223344 |
    |        11 | KARLA   | F    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 11223344 |
    |        12 | DANIELE | F    | DANIELE@GMAIL.COM | 66622233399 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 11223344 |
    |        13 | LORENA  | F    | NULL              | 77722233399 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 11223344 |
    |        15 | ANTONIO | F    | ANTONIO@IG.COM    | 99933344455 | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 11223344 |
    |        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 99933344400 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 11223344 |
    |        18 | CARMEM  | F    | CARMEM@IG.COM     | 99933344444 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 11223344 |
    |        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 99933344422 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 11223344 |
    |        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 99933344422 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 11223344 |
    |        20 | JOICE   | F    | JOICE@GMAIL.COM   | 99933344433 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 11223344 |
    |        20 | JOICE   | F    | JOICE@GMAIL.COM   | 99933344433 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 11223344 |
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+*/

/*  CORRIGI COLUNA SEXO */
    update cliente set sexo = 'M'
        where idcliente = 15;/*
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
    | idcliente | nome    | sexo | email             | cpf         | rua                | bairro     | cidade         | estado | tipo | numero   |
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
    |         2 | CARLA   | F    | CARLA@IG.COM.BR   | 11122233366 | RUA CAPITAO HERMES | JARDINS    | RIO DE JANEIRO | RJ     | RES  | 11223344 |
    |         3 | MARIA   | F    | MARIA@IG.COM.BR   | 11122233377 | RUA PRES VARGAS    | ESTACIO    | SAO PAULO      | SP     | COM  | 11223344 |
    |         5 | CELIA   | F    | CELIA@IG.COM.BR   | 11122233399 | RUA DO OUVIDOR     | CENTRO     | SALVADOR       | BA     | COM  | 11223344 |
    |         7 | PAULA   | F    | NULL              | 33322233399 | RUA URUGUAIANA     | AVENIDA    | CURITIBA       | MT     | CEL  | 11223344 |
    |        11 | KARLA   | F    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 11223344 |
    |        11 | KARLA   | F    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 11223344 |
    |        11 | KARLA   | F    | KARLA@GMAIL.COM   | 55522233399 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 11223344 |
    |        12 | DANIELE | F    | DANIELE@GMAIL.COM | 66622233399 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 11223344 |
    |        13 | LORENA  | F    | NULL              | 77722233399 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 11223344 |
    |        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 99933344400 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 11223344 |
    |        18 | CARMEM  | F    | CARMEM@IG.COM     | 99933344444 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 11223344 |
    |        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 99933344422 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 11223344 |
    |        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 99933344422 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 11223344 |
    |        20 | JOICE   | F    | JOICE@GMAIL.COM   | 99933344433 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 11223344 |
    |        20 | JOICE   | F    | JOICE@GMAIL.COM   | 99933344433 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 11223344 |
    +-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+*/

/*  QUANTIDADE DE HOMENS E MULHERES */
    select count(*) as quantidade, sexo
        from cliente
            group by sexo;/*
    +------------+------+
    | quantidade | sexo |
    +------------+------+
    |          8 | M    |
    |         12 | F    |
    +------------+------+*/

/*  IDS E EMAILS DAS MULEHES QUE MORAM NO CENTRO DO RIO DE JANEIRO */
/*  1 */
    select c.idcliente, c.email, c.nome, c.sexo
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente;/*
    +-----------+-------------------+---------+------+
    | idcliente | email             | nome    | sexo |
    +-----------+-------------------+---------+------+
    |         1 | JOAO@IG.COM.BR    | JOAO    | M    |
    |         2 | CARLA@IG.COM.BR   | CARLA   | F    |
    |         3 | MARIA@IG.COM.BR   | MARIA   | F    |
    |         4 | CARLOS@IG.COM.BR  | CARLOS  | M    |
    |         5 | CELIA@IG.COM.BR   | CELIA   | F    |
    |         6 | NULL              | ARMANDO | M    |
    |         7 | NULL              | PAULA   | F    |
    |         9 | ANDRE@GLOBO.COM   | ANDRE   | M    |
    |         9 | ANDRE@GLOBO.COM   | ANDRE   | M    |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        12 | DANIELE@GMAIL.COM | DANIELE | F    |
    |        13 | NULL              | LORENA  | F    |
    |        15 | ANTONIO@IG.COM    | ANTONIO | M    |
    |        16 | ANTONIO@UOL.COM   | ANTONIO | M    |
    |        17 | ELAINE@GLOBO.COM  | ELAINE  | F    |
    |        18 | CARMEM@IG.COM     | CARMEM  | F    |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    |
    +-----------+-------------------+---------+------+*/

/*  2 */
    select c.idcliente, c.email, c.nome, c.sexo
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F';/*
    +-----------+-------------------+---------+------+
    | idcliente | email             | nome    | sexo |
    +-----------+-------------------+---------+------+
    |         2 | CARLA@IG.COM.BR   | CARLA   | F    |
    |         3 | MARIA@IG.COM.BR   | MARIA   | F    |
    |         5 | CELIA@IG.COM.BR   | CELIA   | F    |
    |         7 | NULL              | PAULA   | F    |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        12 | DANIELE@GMAIL.COM | DANIELE | F    |
    |        13 | NULL              | LORENA  | F    |
    |        17 | ELAINE@GLOBO.COM  | ELAINE  | F    |
    |        18 | CARMEM@IG.COM     | CARMEM  | F    |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    |
    +-----------+-------------------+---------+------+*/

/*  3 */
    select c.idcliente, c.email, c.nome, c.sexo
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F'
            and bairro = 'CENTRO'
            and cidade = 'RIO DE JANEIRO';/*
    +-----------+-------------------+---------+------+
    | idcliente | email             | nome    | sexo |
    +-----------+-------------------+---------+------+
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    |
    +-----------+-------------------+---------+------+*/

/*  4 */
    select c.idcliente, c.email, c.nome, c.sexo, t.tipo, e.bairro, e.cidade
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F'
            and bairro = 'CENTRO'
            and cidade = 'RIO DE JANEIRO';/*
    +-----------+-------------------+---------+------+------+--------+----------------+
    | idcliente | email             | nome    | sexo | tipo | bairro | cidade         |
    +-----------+-------------------+---------+------+------+--------+----------------+
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    | CEL  | CENTRO | RIO DE JANEIRO |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    | CEL  | CENTRO | RIO DE JANEIRO |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    | COM  | CENTRO | RIO DE JANEIRO |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    | RES  | CENTRO | RIO DE JANEIRO |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    | RES  | CENTRO | RIO DE JANEIRO |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    | RES  | CENTRO | RIO DE JANEIRO |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    | COM  | CENTRO | RIO DE JANEIRO |
    +-----------+-------------------+---------+------+------+--------+----------------+*/

/*  5 */
    select c.idcliente, c.email, c.nome, c.sexo, t.tipo, e.bairro, e.cidade
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F'
            and bairro = 'CENTRO'
            and cidade = 'RIO DE JANEIRO'
            and tipo = 'RES'
                or tipo = 'COM';/*
    +-----------+-------------------+---------+------+------+------------+----------------+
    | idcliente | email             | nome    | sexo | tipo | bairro     | cidade         |
    +-----------+-------------------+---------+------+------+------------+----------------+
    |         3 | MARIA@IG.COM.BR   | MARIA   | F    | COM  | ESTACIO    | SAO PAULO      |
    |         5 | CELIA@IG.COM.BR   | CELIA   | F    | COM  | CENTRO     | SALVADOR       |
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    | COM  | CENTRO     | RIO DE JANEIRO |
    |        12 | DANIELE@GMAIL.COM | DANIELE | F    | COM  | COPACABANA | RIO DE JANEIRO |
    |        13 | NULL              | LORENA  | F    | COM  | CENTRO     | VITORIA        |
    |        16 | ANTONIO@UOL.COM   | ANTONIO | M    | COM  | JARDINS    | SAO PAULO      |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    | RES  | CENTRO     | RIO DE JANEIRO |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    | RES  | CENTRO     | RIO DE JANEIRO |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    | RES  | CENTRO     | RIO DE JANEIRO |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    | COM  | CENTRO     | RIO DE JANEIRO |
    +-----------+-------------------+---------+------+------+------------+----------------+*/

/*  5.1 */
    select c.idcliente, c.email, c.nome, c.sexo, t.tipo, e.bairro, e.cidade
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F'
            and bairro = 'CENTRO'
            and cidade = 'RIO DE JANEIRO'
            and (tipo = 'RES' or tipo = 'COM');/*
    +-----------+-------------------+---------+------+------+--------+----------------+
    | idcliente | email             | nome    | sexo | tipo | bairro | cidade         |
    +-----------+-------------------+---------+------+------+--------+----------------+
    |        11 | KARLA@GMAIL.COM   | KARLA   | F    | COM  | CENTRO | RIO DE JANEIRO |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    | RES  | CENTRO | RIO DE JANEIRO |
    |        19 | ADRIANA@GMAIL.COM | ADRIANA | F    | RES  | CENTRO | RIO DE JANEIRO |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    | RES  | CENTRO | RIO DE JANEIRO |
    |        20 | JOICE@GMAIL.COM   | JOICE   | F    | COM  | CENTRO | RIO DE JANEIRO |
    +-----------+-------------------+---------+------+------+--------+----------------+*/

/*  NOME, EMAIL, TELEFONE DOS CLIENTES DO ESTADO DO RIO DE JANEIRO */
    select c.nome, c.email,t.numero
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where estado  = 'RJ';/*
    +---------+-------------------+----------+
    | nome    | email             | numero   |
    +---------+-------------------+----------+
    | CARLA   | CARLA@IG.COM.BR   | 11223344 |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 |
    | DANIELE | DANIELE@GMAIL.COM | 11223344 |
    | ADRIANA | ADRIANA@GMAIL.COM | 11223344 |
    | ADRIANA | ADRIANA@GMAIL.COM | 11223344 |
    | JOICE   | JOICE@GMAIL.COM   | 11223344 |
    | JOICE   | JOICE@GMAIL.COM   | 11223344 |
    +---------+-------------------+----------+*/

    select c.sexo, c.nome, c.email, t.tipo, t.numero, e.estado
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F';

    select c.sexo, c.nome, c.email, t.tipo, t.numero, e.estado
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F' and estado = 'SP';/*
    +------+--------+-----------------+------+----------+--------+
    | sexo | nome   | email           | tipo | numero   | estado |
    +------+--------+-----------------+------+----------+--------+
    | F    | MARIA  | MARIA@IG.COM.BR | COM  | 11223344 | SP     |
    | F    | CARMEM | CARMEM@IG.COM   | RES  | 11223344 | SP     |
    +------+--------+-----------------+------+----------+--------+*/

    select c.sexo, c.nome, c.email, t.tipo, t.numero, e.estado
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente
        where sexo = 'F' and estado = 'SP' and tipo = 'CEL';
/*  Empty set (0.00 sec) */

    select c.sexo, c.nome, c.email, t.tipo, t.numero, e.estado
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t
                on c.idcliente = t.id_cliente;/*
    +------+---------+-------------------+------+----------+--------+
    | sexo | nome    | email             | tipo | numero   | estado |
    +------+---------+-------------------+------+----------+--------+
    | M    | JOAO    | JOAO@IG.COM.BR    | CEL  | 11223344 | MG     |
    | F    | CARLA   | CARLA@IG.COM.BR   | RES  | 11223344 | RJ     |
    | F    | MARIA   | MARIA@IG.COM.BR   | COM  | 11223344 | SP     |
    | M    | CARLOS  | CARLOS@IG.COM.BR  | RES  | 11223344 | ES     |
    | F    | CELIA   | CELIA@IG.COM.BR   | COM  | 11223344 | BA     |
    | M    | ARMANDO | NULL              | CEL  | 11223344 | MT     |
    | F    | PAULA   | NULL              | CEL  | 11223344 | MT     |
    | M    | ANDRE   | ANDRE@GLOBO.COM   | RES  | 11223344 | MG     |
    | M    | ANDRE   | ANDRE@GLOBO.COM   | CEL  | 11223344 | MG     |
    | F    | KARLA   | KARLA@GMAIL.COM   | CEL  | 11223344 | RJ     |
    | F    | KARLA   | KARLA@GMAIL.COM   | CEL  | 11223344 | RJ     |
    | F    | KARLA   | KARLA@GMAIL.COM   | COM  | 11223344 | RJ     |
    | F    | DANIELE | DANIELE@GMAIL.COM | COM  | 11223344 | RJ     |
    | F    | LORENA  | NULL              | COM  | 11223344 | ES     |
    | M    | ANTONIO | ANTONIO@IG.COM    | CEL  | 11223344 | PR     |
    | M    | ANTONIO | ANTONIO@UOL.COM   | COM  | 11223344 | SP     |
    | F    | ELAINE  | ELAINE@GLOBO.COM  | CEL  | 11223344 | PR     |
    | F    | CARMEM  | CARMEM@IG.COM     | RES  | 11223344 | SP     |
    | F    | ADRIANA | ADRIANA@GMAIL.COM | RES  | 11223344 | RJ     |
    | F    | ADRIANA | ADRIANA@GMAIL.COM | RES  | 11223344 | RJ     |
    | F    | JOICE   | JOICE@GMAIL.COM   | RES  | 11223344 | RJ     |
    | F    | JOICE   | JOICE@GMAIL.COM   | COM  | 11223344 | RJ     |
    +------+---------+-------------------+------+----------+--------+*/

/*  NOME, EMAIL, TELEFONE DO ESTADO DO RIO DE JANEIRO */

    select c.nome, c.email, e.cidade, t.tipo, t.numero as celular
        from cliente c
        inner join endereco e 
            on c.idcliente = e.id_cliente
        inner join telefone t 
            on c.idcliente = t.id_cliente
        where tipo = 'CEL'
            and estado = 'RJ';/*
    +-------+-----------------+----------+
    | nome  | email           | celular  |
    +-------+-----------------+----------+
    | KARLA | KARLA@GMAIL.COM | 11223344 |
    | KARLA | KARLA@GMAIL.COM | 11223344 |
    +-------+-----------------+----------+*/

    select c.nome, c.email, t.numero as celular
        from cliente c
            inner join endereco e 
                on c.idcliente = e.id_cliente
            inner join telefone t 
                on c.idcliente = t.id_cliente
        where sexo = 'F'
        	and estado = 'SP';/*
    +--------+-----------------+----------+
    | nome   | email           | celular  |
    +--------+-----------------+----------+
    | MARIA  | MARIA@IG.COM.BR | 11223344 |
    | CARMEM | CARMEM@IG.COM   | 11223344 |
    +--------+-----------------+----------+*/
