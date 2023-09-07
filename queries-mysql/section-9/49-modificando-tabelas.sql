/*  DDL - DATA DEFINITION LANGUAGE */
    CREATE TABLE produto(
    	idproduto INT PRIMARY KEY AUTO_INCREMENT,
    	nome_produto VARCHAR(50) NOT NULL,
    	valor_unitario INT NOT NULL,
    	frete FLOAT(10,2) NOT NULL
    );

/*  ALTERANDO O NOME DE UMA COLUNA */
/*  CHANGE */
    ALTER TABLE PRODUTO
    CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

    DESC PRODUTO;/*
    +----------------+-------------+------+-----+---------+----------------+
    | Field          | Type        | Null | Key | Default | Extra          |
    +----------------+-------------+------+-----+---------+----------------+
    | IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
    | NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
    | VALOR_UNITARIO | int         | NO   |     | NULL    |                |
    | FRETE          | float(10,2) | NO   |     | NULL    |                |
    +----------------+-------------+------+-----+---------+----------------+*/

/*  TEM MELHOR MANEIRA DE ALTERAR O TIPO DE UMA COLUNA SEM PRECISAR */
/*  ALTERAR O NOME DA TABELA NO MESMO COMANDO. */
ALTER TABLE PRODUTO
    CHANGE VALOR_UNNITARIO VALOR_UNITARIO INT;/*
    +----------------+-------------+------+-----+---------+----------------+
    | Field          | Type        | Null | Key | Default | Extra          |
    +----------------+-------------+------+-----+---------+----------------+
    | IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
    | NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
    | VALOR_UNITARIO | int         | YES  |     | NULL    |                |
    | FRETE          | float(10,2) | NO   |     | NULL    |                |
    +----------------+-------------+------+-----+---------+----------------+*/

/*  MANEIRA MAIS ELEGANTE DE ALTERAR O TIPO DE UMA COLUNA */
/*  MODIFY */
    ALTER TABLE PRODUTO
        MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

    DESC PRODUTO;/*
    +----------------+-------------+------+-----+---------+----------------+
    | Field          | Type        | Null | Key | Default | Extra          |
    +----------------+-------------+------+-----+---------+----------------+
    | IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
    | NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
    | VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
    | FRETE          | float(10,2) | NO   |     | NULL    |                |
    +----------------+-------------+------+-----+---------+----------------+*/

/*  ADICIONANDO COLUNAS NA TABELA */
/*  A NOVA COLUNA VAI PARA O FIM DA TABELA POR PADRÃO */
    ALTER TABLE PRODUTO
        ADD PESO FLOAT(10,2) NOT NULL;

    DESC PRODUTO;/*
    +----------------+-------------+------+-----+---------+----------------+
    | Field          | Type        | Null | Key | Default | Extra          |
    +----------------+-------------+------+-----+---------+----------------+
    | IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
    | NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
    | VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
    | FRETE          | float(10,2) | NO   |     | NULL    |                |
    | PESO           | float(10,2) | NO   |     | NULL    |                |
    +----------------+-------------+------+-----+---------+----------------+*/

/*  APAGANDO UMA COLUNA */
    ALTER TABLE PRODUTO
        DROP COLUMN PESO;

    DESC PRODUTO;/*
    +----------------+-------------+------+-----+---------+----------------+
    | Field          | Type        | Null | Key | Default | Extra          |
    +----------------+-------------+------+-----+---------+----------------+
    | IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
    | NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
    | VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
    | FRETE          | float(10,2) | NO   |     | NULL    |                |
    +----------------+-------------+------+-----+---------+----------------+*/

/*  ADICONAR COLUNA NUMA POSIÇÃO ESPECIFICA */
/*  AFTER */
    ALTER TABLE PRODUTO
        ADD COLUMN PESO FLOAT(10,2) NOT NULL
        AFTER NOME_PRODUTO;

    DESC PRODUTO;/*
    +----------------+-------------+------+-----+---------+----------------+
    | Field          | Type        | Null | Key | Default | Extra          |
    +----------------+-------------+------+-----+---------+----------------+
    | IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
    | NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
    | PESO           | float(10,2) | NO   |     | NULL    |                |
    | VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
    | FRETE          | float(10,2) | NO   |     | NULL    |                |
    +----------------+-------------+------+-----+---------+----------------+*/

/*  ADICIONANDO UMA COLUNA NO INICIO */
/*  FIRST */
    ALTER TABLE PRODUTO
        DROP COLUMN PESO;

    DESC PRODUTO;/*
    +----------------+-------------+------+-----+---------+----------------+
    | Field          | Type        | Null | Key | Default | Extra          |
    +----------------+-------------+------+-----+---------+----------------+
    | IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
    | NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
    | VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
    | FRETE          | float(10,2) | NO   |     | NULL    |                |
    +----------------+-------------+------+-----+---------+----------------+*/

ALTER TABLE PRODUTO
    ADD COLUMN PESO FLOAT(10,2)
        FIRST;/*
    +----------------+-------------+------+-----+---------+----------------+
    | Field          | Type        | Null | Key | Default | Extra          |
    +----------------+-------------+------+-----+---------+----------------+
    | PESO           | float(10,2) | YES  |     | NULL    |                |
    | IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
    | NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
    | VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
    | FRETE          | float(10,2) | NO   |     | NULL    |                |
    +----------------+-------------+------+-----+---------+----------------+*/
