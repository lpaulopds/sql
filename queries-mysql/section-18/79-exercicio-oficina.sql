/*
    MODELAGEM LÓGICA E FÍSICA
*/
/*
    CRIAR BANCO DE DADOS CHAMADO PROJETO.
    FAZER A SEGUINTE MODELAGEM:

        MODERNIZAÇÃO OFICINA
            - CADASTRAR CARROS E SEUS RESPECTIVOS DONOS
            - UM CLIENTE POR CARRO
            - CADASTRAR MARCA DO CARRO
            - CADASTRAR COR DA NOVA PINTURA, UM PODE POSSUIR MAIS DE UMA COR
            - NÃO É OBRIGATÓRIO O CLIENTE CADASTRAR O TELEFONE
*/

CREATE DATABASE projeto;
USE projeto;

/* AULA 81 */

CREATE DATABASE OFICINA;
USE OFICINA;

/*
    CRIAÇÃO DAS 'TABELAS' DE ACORDO COM MODELAGEM FEITA
    ANTERIORMENTE NO STARUML.
*/

/*
    O UNIQUE NA COLUNA ID_CARRO É UMA CARACTERISTICA
    DE RELAÇÃO 1x1 ENTRE TABELAS
*/

CREATE TABLE CLIENTE (
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    SEXO ENUM('M','F') NOT NULL,
    ID_CARRO INT UNIQUE
);

CREATE TABLE TELEFONE (
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('CEL', 'RES', 'COM') NOT NULL,
    NUMERO VARCHAR(30) NOT NULL,
    ID_CLIENTE INT
);

/*
    O UNIQUE NA COLUNA MARCA É UMA CARACTERISTICA
    DE RELAÇÃO 1x1 ENTRE TABELAS
*/
CREATE TABLE MARCA (
    IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
    MARCA VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO (
    IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
    MODELO VARCHAR(30) NOT NULL,
    PLACA VARCHAR(30) NOT NULL UNIQUE,
    ID_MARCA INT
);

/*
    O UNIQUE NA COLUNA COR É UMA CARACTERISTICA
    DE RELAÇÃO 1x1 ENTRE TABELAS
*/
CREATE TABLE COR (
    IDCOR INT PRIMARY KEY AUTO_INCREMENT,
    COR VARCHAR(30) UNIQUE
);

/*
    A CHAVE PRIMÁRIA É A UNIÃO DOS DOIS IDS,
    COMUM EM TABELAS ASSOCIATIVAS. DESSA MANEIRA
    NÃO É POSSÍVEL CADASTRAR O MESMO CARRO E COR
    MAIS DE UMA VEZ.
*/
CREATE TABLE CARRO_COR (
    ID_CARRO INT,
    ID_COR INT,
    PRIMARY KEY(ID_CARRO, ID_COR)
);


/*
    CRIAÇÃO DAS 'CONSTRAINTS' DE ACORDO COM MODELAGEM FEITA
    ANTERIORMENTE NO STARUML.
*/

/*
    OS NOMES DAS CONSTRAINTS É O NOME
    DA TABELA QUE ALTERA E O NOME DA TABELA
    QUE A CHAVE ESTRANGEIRA FAZ REFERÊNCIA.
*/

/*
    A CHAVE ESTRANGEIRA ID_CLIENTE FAZ
    REFERÊNCIA A CHAVE PRIMÁRIA IDCLIENTE.
*/

ALTER TABLE TELEFONE
    ADD CONSTRAINT FK_TELEFONE_CLIENTE
        FOREIGN KEY(ID_CLIENTE)
        REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CLIENTE
    ADD CONSTRAINT FK_CLIENTE_CARRO
        FOREIGN KEY(ID_CARRO)
        REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO
    ADD CONSTRAINT FK_CARRO_MARCA
        FOREIGN KEY(ID_MARCA)
        REFERENCES MARCA(IDMARCA);

ALTER TABLE CARRO_COR
    ADD CONSTRAINT FK_COR
        FOREIGN KEY(ID_COR)
        REFERENCES COR(IDCOR);

ALTER TABLE CARRO_COR
    ADD CONSTRAINT
        FOREIGN KEY(ID_CARRO)
        REFERENCES CARRO(IDCARRO);


