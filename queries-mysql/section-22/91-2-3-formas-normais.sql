/* 2º E 3º FORMAS NORMAIS */
/*
    CONSULTE O ARQUIVO DE MODELAGEM DESTA AULA
    PARA SABER MAIS SOBRE FORMAS NORMAIS.
*/

CREATE DATABASE CONSULTORIO;

USE CONSULTORIO;

CREATE TABLE PACIENTE(
    IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(50),
    SEXO CHAR(1),
    EMAIL VARCHAR(60),
    NASCIMENTO DATE
);

CREATE TABLE MEDICO(
    IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(50),
    SEXO CHAR(1),
    ESPECIALIDADE VARCHAR(30),
    FUNCIONARIO ENUM('S','N')
);

CREATE TABLE HOSPITAL(
    IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(50),
    BAIRRO VARCHAR(50),
    CIDADE VARCHAR(30),
    ESTADO CHAR(2)
);

CREATE TABLE CONSULTA(
    IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
    ID_PACIENTE INT,
    ID_MEDICO INT,
    ID_HOSPITAL INT,
    DATA DATETIME,
    DIAGNOSTICO VARCHAR(50)
);

CREATE TABLE INTERNACAO(
    IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
    ENTRADA DATETIME,
    QUARTO INT,
    SAIDA DATETIME,
    OBSERVACOES VARCHAR(50),
    ID_CONSULTA INT UNIQUE
);

SHOW TABLES;/*
+-----------------------+
| Tables_in_CONSULTORIO |
+-----------------------+
| CONSULTA              |
| HOSPITAL              |
| INTERNACAO            |
| MEDICO                |
| PACIENTE              |
+-----------------------+*/

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_PACIENTE
    FOREIGN KEY(ID_PACIENTE) REFERENCES PACIENTE(IDPACIENTE);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_MEDICO
    FOREIGN KEY(ID_MEDICO) REFERENCES MEDICO(IDMEDICO);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_HOSPITAL
    FOREIGN KEY(ID_HOSPITAL) REFERENCES HOSPITAL(IDHOSPITAL);

ALTER TABLE INTERNACAO ADD CONSTRAINT FK_INTERNACAO_CONSULTA
    FOREIGN KEY(ID_CONSULTA) REFERENCES CONSULTA(IDCONSULTA);

/* VER CHAVES ESTRANGEIRAS - DICIONÁRIO DE DADOS */

SHOW DATABASES;
USE information_schema;
SHOW TABLES;

DESC TABLE_CONSTRAINTS;/*
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(64) | NO   |     | NULL    |       |
| CONSTRAINT_SCHEMA  | varchar(64) | NO   |     | NULL    |       |
| CONSTRAINT_NAME    | varchar(64) | YES  |     | NULL    |       |
| TABLE_SCHEMA       | varchar(64) | NO   |     | NULL    |       |
| TABLE_NAME         | varchar(64) | NO   |     | NULL    |       |
| CONSTRAINT_TYPE    | varchar(11) | NO   |     |         |       |
| ENFORCED           | varchar(3)  | NO   |     |         |       |
+--------------------+-------------+------+-----+---------+-------+*/

SELECT CONSTRAINT_NAME FROM TABLE_CONSTRAINTS;/*
+--------------------+--------------------+------------------------+--------------------+------------------------------------------------------+-----------------+----------+
| CONSTRAINT_CATALOG | CONSTRAINT_SCHEMA  | CONSTRAINT_NAME        | TABLE_SCHEMA       | TABLE_NAME                                           | CONSTRAINT_TYPE | ENFORCED |
+--------------------+--------------------+------------------------+--------------------+------------------------------------------------------+-----------------+----------+
| def                | CONSULTORIO        | FK_CONSULTA_HOSPITAL   | CONSULTORIO        | CONSULTA                                             | FOREIGN KEY     | YES      |
| def                | CONSULTORIO        | FK_CONSULTA_MEDICO     | CONSULTORIO        | CONSULTA                                             | FOREIGN KEY     | YES      |
| def                | CONSULTORIO        | FK_CONSULTA_PACIENTE   | CONSULTORIO        | CONSULTA                                             | FOREIGN KEY     | YES      |
| def                | CONSULTORIO        | FK_INTERNACAO_CONSULTA | CONSULTORIO        | INTERNACAO                                           | FOREIGN KEY     | YES      |
+--------------------+--------------------+------------------------+--------------------+------------------------------------------------------+-----------------+----------+*/
