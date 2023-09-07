/*  nome, email, numero, estado */
    select c.nome, c.email, t.numero, e.estado
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t 
                on c.idcliente = t.id_cliente; /*
    +---------+-------------------+----------+--------+
    | nome    | email             | numero   | estado |
    +---------+-------------------+----------+--------+
    | JOAO    | JOAO@IG.COM.BR    | 11223344 | MG     |
    | CARLA   | CARLA@IG.COM.BR   | 11223344 | RJ     |
    | MARIA   | MARIA@IG.COM.BR   | 11223344 | SP     |
    | CARLOS  | CARLOS@IG.COM.BR  | 11223344 | ES     |
    | CELIA   | CELIA@IG.COM.BR   | 11223344 | BA     |
    | ARMANDO | NULL              | 11223344 | MT     |
    | PAULA   | NULL              | 11223344 | MT     |
    | ANDRE   | ANDRE@GLOBO.COM   | 11223344 | MG     |
    | ANDRE   | ANDRE@GLOBO.COM   | 11223344 | MG     |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 | RJ     |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 | RJ     |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 | RJ     |
    | DANIELE | DANIELE@GMAIL.COM | 11223344 | RJ     |
    | LORENA  | NULL              | 11223344 | ES     |
    | ANTONIO | ANTONIO@IG.COM    | 11223344 | PR     |
    | ANTONIO | ANTONIO@UOL.COM   | 11223344 | SP     |
    | ELAINE  | ELAINE@GLOBO.COM  | 11223344 | PR     |
    | CARMEM  | CARMEM@IG.COM     | 11223344 | SP     |
    | ADRIANA | ADRIANA@GMAIL.COM | 11223344 | RJ     |
    | ADRIANA | ADRIANA@GMAIL.COM | 11223344 | RJ     |
    | JOICE   | JOICE@GMAIL.COM   | 11223344 | RJ     |
    | JOICE   | JOICE@GMAIL.COM   | 11223344 | RJ     |
    +---------+-------------------+----------+--------+*/

    select  c.nome,
            ifnull(c.email, '*****@*****.***') as email,
            t.numero,
            e.estado
        from cliente c
            inner join endereco e
                on c.idcliente = e.id_cliente
            inner join telefone t 
                on c.idcliente = t.id_cliente;/*
    +---------+-------------------+----------+--------+
    | nome    | email             | numero   | estado |
    +---------+-------------------+----------+--------+
    | JOAO    | JOAO@IG.COM.BR    | 11223344 | MG     |
    | CARLA   | CARLA@IG.COM.BR   | 11223344 | RJ     |
    | MARIA   | MARIA@IG.COM.BR   | 11223344 | SP     |
    | CARLOS  | CARLOS@IG.COM.BR  | 11223344 | ES     |
    | CELIA   | CELIA@IG.COM.BR   | 11223344 | BA     |
    | ARMANDO | *****@*****.***   | 11223344 | MT     |
    | PAULA   | *****@*****.***   | 11223344 | MT     |
    | ANDRE   | ANDRE@GLOBO.COM   | 11223344 | MG     |
    | ANDRE   | ANDRE@GLOBO.COM   | 11223344 | MG     |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 | RJ     |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 | RJ     |
    | KARLA   | KARLA@GMAIL.COM   | 11223344 | RJ     |
    | DANIELE | DANIELE@GMAIL.COM | 11223344 | RJ     |
    | LORENA  | *****@*****.***   | 11223344 | ES     |
    | ANTONIO | ANTONIO@IG.COM    | 11223344 | PR     |
    | ANTONIO | ANTONIO@UOL.COM   | 11223344 | SP     |
    | ELAINE  | ELAINE@GLOBO.COM  | 11223344 | PR     |
    | CARMEM  | CARMEM@IG.COM     | 11223344 | SP     |
    | ADRIANA | ADRIANA@GMAIL.COM | 11223344 | RJ     |
    | ADRIANA | ADRIANA@GMAIL.COM | 11223344 | RJ     |
    | JOICE   | JOICE@GMAIL.COM   | 11223344 | RJ     |
    | JOICE   | JOICE@GMAIL.COM   | 11223344 | RJ     |
    +---------+-------------------+----------+--------+*/
