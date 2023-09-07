/*  Sintaxe básica de inserção:
	INSERT INTO TABLE_NAME... */

/*  Na prática:
    com aspas simples nas strings
    e sem aspas nos inteiros */

/*  inserindo sem os nomes da colunas é menos seguro: */
	INSERT INTO cliente
        VALUES ('CELIA','F','CELIA@GAMIL.COM',123456789,'12345678987','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');
	INSERT INTO cliente
        VALUES ('CECILIA','F','CECILIA@GAMIL.COM',123456789,'12345678987','ESPLANADA - VARZEA - BRASILIA - DF');
	INSERT INTO cliente
        VALUES ('LETICIA','F','LETICIA@GAMIL.COM',123456789,'12345678987','HORIZONTINO - INTERIOR - MINAS GERAIS - MG');

/*  inserindo com os nomes das colunas: */
	INSERT INTO cliente(nome, sexo, email, cpf, telefone, endereco)
        VALUES ('ALFREDO','M','ALFREDO@GAMIL.COM',123456789,'12345678987','AVENUE - CENTRO - BELO HORIZONTE - BH');

/*  dessa maneira é possível omitir colunas
    e alterar ordem das colunas na horada inserção. */

/*  inserindo de forma compacta (apenas mysql): */
	INSERT INTO cliente
        VALUES('SUZANA','F','SUZANA@GMAIL.COM',123456789,'12345678987','ANTIONIO CARLOS - OESTE - SÃO PAULO - SP'),('MATHEUS','M','MATHEUS@GMAIL.COM',123456789,'12345678987','SÃO MATHEUS - OESTE - SÃO PAULO - SP');

/*  Atenção!
    O tipo int tem um range máximo para
    os valores inseridos. Utilize campos
    do tipo int apenas para valores
    que precisam realmente de operações
    matemáticas. */
