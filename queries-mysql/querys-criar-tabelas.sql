    create table cliente(
    	idcliente int primary key auto_increment,
    	nome varchar(30) not null,
    	sexo enum('M','F') not null,
    	email varchar(50) unique,
    	cpf varchar(15) unique
    );/*
    +-----------+---------------+------+-----+---------+----------------+
    | Field     | Type          | Null | Key | Default | Extra          |
    +-----------+---------------+------+-----+---------+----------------+
    | idcliente | int           | NO   | PRI | NULL    | auto_increment |
    | nome      | varchar(30)   | NO   |     | NULL    |                |
    | sexo      | enum('M','F') | NO   |     | NULL    |                |
    | email     | varchar(50)   | YES  | UNI | NULL    |                |
    | cpf       | varchar(15)   | YES  | UNI | NULL    |                |
    +-----------+---------------+------+-----+---------+----------------+*/
    
    create table endereco(
    	idendereco int primary key auto_increment,
    	rua varchar(30) not null,
    	bairro varchar(30) not null,
    	cidade varchar(30) not null,
    	estado char(2) not null,
    	id_cliente int unique,
    	foreign key(id_cliente)
    	references cliente(idcliente)
    );/*
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
    
    create table telefone(
    	idtelefone int primary key auto_increment,
    	tipo enum('RES','COM','CEL') not null,
    	numero varchar(10) not null,
    	id_cliente int,
    	foreign key(id_cliente)
    	references cliente(idcliente)
    );/*
    +------------+-------------------------+------+-----+---------+----------------+
    | Field      | Type                    | Null | Key | Default | Extra          |
    +------------+-------------------------+------+-----+---------+----------------+
    | idtelefone | int                     | NO   | PRI | NULL    | auto_increment |
    | tipo       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
    | numero     | varchar(10)             | NO   |     | NULL    |                |
    | id_cliente | int                     | YES  | MUL | NULL    |                |
    +------------+-------------------------+------+-----+---------+----------------+*/
