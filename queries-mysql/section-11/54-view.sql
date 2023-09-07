    select  c.nome,
            c.sexo,
            c.email,
            t.tipo,
            t.numero,
            e.bairro,
            e.cidade,
            e.estado
            from cliente c 
                inner join telefone t 
                    on c.idcliente = t.id_cliente
                inner join endereco e 
                    on c.idcliente = e.id_cliente;/*
    +---------+------+-------------------+------+----------+------------+----------------+--------+
    | nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
    +---------+------+-------------------+------+----------+------------+----------------+--------+
    | JOAO    | M    | JOAO@IG.COM.BR    | CEL  | 11223344 | CENTRO     | B. HORIZONTE   | MG     |
    | CARLA   | F    | CARLA@IG.COM.BR   | RES  | 11223344 | JARDINS    | RIO DE JANEIRO | RJ     |
    | MARIA   | F    | MARIA@IG.COM.BR   | COM  | 11223344 | ESTACIO    | SAO PAULO      | SP     |
    | CARLOS  | M    | CARLOS@IG.COM.BR  | RES  | 11223344 | AMARALINA  | ESPIRITO SANTO | ES     |
    | CELIA   | F    | CELIA@IG.COM.BR   | COM  | 11223344 | CENTRO     | SALVADOR       | BA     |
    | ARMANDO | M    | NULL              | CEL  | 11223344 | CENTRO     | CAMPINAS       | MT     |
    | PAULA   | F    | NULL              | CEL  | 11223344 | AVENIDA    | CURITIBA       | MT     |
    | ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 11223344 | CASCADURA  | B. HORIZONTE   | MG     |
    | ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 11223344 | CASCADURA  | B. HORIZONTE   | MG     |
    | KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | KARLA   | F    | KARLA@GMAIL.COM   | COM  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | DANIELE | F    | DANIELE@GMAIL.COM | COM  | 11223344 | COPACABANA | RIO DE JANEIRO | RJ     |
    | LORENA  | F    | NULL              | COM  | 11223344 | CENTRO     | VITORIA        | ES     |
    | ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 11223344 | CENTRO     | CURITIBA       | PR     |
    | ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 11223344 | JARDINS    | SAO PAULO      | SP     |
    | ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 11223344 | BOM RETIRO | CURITIBA       | PR     |
    | CARMEM  | F    | CARMEM@IG.COM     | RES  | 11223344 | LAPA       | SAO PAULO      | SP     |
    | ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | JOICE   | F    | JOICE@GMAIL.COM   | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | JOICE   | F    | JOICE@GMAIL.COM   | COM  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    +---------+------+-------------------+------+----------+------------+----------------+--------+*/

/*  CRIANDO UMA VIEW */
    create view relatorio as
    select  c.nome,
            c.sexo,
            c.email,
            t.tipo,
            t.numero,
            e.bairro,
            e.cidade,
            e.estado
            from cliente c 
                inner join telefone t 
                    on c.idcliente = t.id_cliente
                inner join endereco e 
                    on c.idcliente = e.id_cliente;

/*  PROJETANDO COM UMA VIEW */
    select * from relatorio;/*
    +---------+------+-------------------+------+----------+------------+----------------+--------+
    | nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
    +---------+------+-------------------+------+----------+------------+----------------+--------+
    | JOAO    | M    | JOAO@IG.COM.BR    | CEL  | 11223344 | CENTRO     | B. HORIZONTE   | MG     |
    | CARLA   | F    | CARLA@IG.COM.BR   | RES  | 11223344 | JARDINS    | RIO DE JANEIRO | RJ     |
    | MARIA   | F    | MARIA@IG.COM.BR   | COM  | 11223344 | ESTACIO    | SAO PAULO      | SP     |
    | CARLOS  | M    | CARLOS@IG.COM.BR  | RES  | 11223344 | AMARALINA  | ESPIRITO SANTO | ES     |
    | CELIA   | F    | CELIA@IG.COM.BR   | COM  | 11223344 | CENTRO     | SALVADOR       | BA     |
    | ARMANDO | M    | NULL              | CEL  | 11223344 | CENTRO     | CAMPINAS       | MT     |
    | PAULA   | F    | NULL              | CEL  | 11223344 | AVENIDA    | CURITIBA       | MT     |
    | ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 11223344 | CASCADURA  | B. HORIZONTE   | MG     |
    | ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 11223344 | CASCADURA  | B. HORIZONTE   | MG     |
    | KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | KARLA   | F    | KARLA@GMAIL.COM   | COM  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | DANIELE | F    | DANIELE@GMAIL.COM | COM  | 11223344 | COPACABANA | RIO DE JANEIRO | RJ     |
    | LORENA  | F    | NULL              | COM  | 11223344 | CENTRO     | VITORIA        | ES     |
    | ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 11223344 | CENTRO     | CURITIBA       | PR     |
    | ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 11223344 | JARDINS    | SAO PAULO      | SP     |
    | ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 11223344 | BOM RETIRO | CURITIBA       | PR     |
    | CARMEM  | F    | CARMEM@IG.COM     | RES  | 11223344 | LAPA       | SAO PAULO      | SP     |
    | ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | JOICE   | F    | JOICE@GMAIL.COM   | RES  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    | JOICE   | F    | JOICE@GMAIL.COM   | COM  | 11223344 | CENTRO     | RIO DE JANEIRO | RJ     |
    +---------+------+-------------------+------+----------+------------+----------------+--------+*/

    show tables; /* mostra também as views */ 
    desc relatorio; /* mostra estrutura dos dados da query */

/*  DELETA UMA VIEW */
    drop view relatorio;

/*  CRIANDO VIEW COM PREFIXO PARA FACILITAR IDENTIFICAÇÃO */
    create view v_relatorio as
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
                    on c.idcliente = e.id_cliente;
    
    select nome, email, numero, estado
        from v_relatorio;/*
    +---------+----------+--------+
    | nome    | numero   | estado |
    +---------+----------+--------+
    | JOAO    | 11223344 | MG     |
    | CARLA   | 11223344 | RJ     |
    | MARIA   | 11223344 | SP     |
    | CARLOS  | 11223344 | ES     |
    | CELIA   | 11223344 | BA     |
    | ARMANDO | 11223344 | MT     |
    | PAULA   | 11223344 | MT     |
    | ANDRE   | 11223344 | MG     |
    | ANDRE   | 11223344 | MG     |
    | KARLA   | 11223344 | RJ     |
    | KARLA   | 11223344 | RJ     |
    | KARLA   | 11223344 | RJ     |
    | DANIELE | 11223344 | RJ     |
    | LORENA  | 11223344 | ES     |
    | ANTONIO | 11223344 | PR     |
    | ANTONIO | 11223344 | SP     |
    | ELAINE  | 11223344 | PR     |
    | CARMEM  | 11223344 | SP     |
    | ADRIANA | 11223344 | RJ     |
    | ADRIANA | 11223344 | RJ     |
    | JOICE   | 11223344 | RJ     |
    | JOICE   | 11223344 | RJ     |
    +---------+----------+--------+*/
