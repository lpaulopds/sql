/* AUTORELACIONAMENTO */

CREATE DATABASE AUTOREL;
USE AUTOREL;

CREATE TABLE CURSOS(
    IDCURSOS INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    HORAS INT,
    VALOR FLOAT(10,2),
    ID_PREREQ INT
);

ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
    FOREIGN KEY(ID_PREREQ) REFERENCES CURSOS(IDCURSOS);

INSERT INTO CURSOS VALUES(NULL,'BD RELACIONAL',20,400.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'BUSINESS INTELIGENCE',40,800.00,1);
INSERT INTO CURSOS VALUES(NULL,'RELATORIOS AVANCADOS',20,600.00,2);
INSERT INTO CURSOS VALUES(NULL,'LOGICA DE PROG',20,400.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'RUBY',30,500.00,4);

SELECT * FROM CURSOS;/*
+----------+----------------------+-------+--------+-----------+
| IDCURSOS | NOME                 | HORAS | VALOR  | ID_PREREQ |
+----------+----------------------+-------+--------+-----------+
|        1 | BD RELACIONAL        |    20 | 400.00 |      NULL |
|        2 | BUSINESS INTELIGENCE |    40 | 800.00 |         1 |
|        3 | RELATORIOS AVANCADOS |    20 | 600.00 |         2 |
|        4 | LOGICA DE PROG       |    20 | 400.00 |      NULL |
|        5 | RUBY                 |    30 | 500.00 |         4 |
+----------+----------------------+-------+--------+-----------+*/

SELECT NOME, VALOR, HORAS, IFNULL(ID_PREREQ,"SEM REQ") REQUISITO
    FROM CURSOS;/*
+----------------------+--------+-------+-----------+
| NOME                 | VALOR  | HORAS | REQUISITO |
+----------------------+--------+-------+-----------+
| BD RELACIONAL        | 400.00 |    20 | SEM REQ   |
| BUSINESS INTELIGENCE | 800.00 |    40 | 1         |
| RELATORIOS AVANCADOS | 600.00 |    20 | 2         |
| LOGICA DE PROG       | 400.00 |    20 | SEM REQ   |
| RUBY                 | 500.00 |    30 | 4         |
+----------------------+--------+-------+-----------+*/

/* AUTORELACIONAMENTO */
SELECT
    C.NOME AS  CURSO,
    C.VALOR AS PREÇO,
    C.HORAS AS CARGA,
    IFNULL(P.NOME, "-") AS REQUISITO
    FROM CURSOS C
        INNER JOIN CURSOS P
            ON P.IDCURSOS = C.ID_PREREQ;

/* PROJETA TODOS OS CURSOS */
SELECT
    C.NOME AS  CURSO,
    C.VALOR AS PREÇO,
    C.HORAS AS CARGA,
    IFNULL(P.NOME, "-") AS REQUISITO
    FROM CURSOS C
        LEFT JOIN CURSOS P
            ON P.IDCURSOS = C.ID_PREREQ;
