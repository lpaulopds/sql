SELECT CONSTRAINT_SCHEMA AS "BANCO",
    TABLE_NAME AS "TABELA",
    CONSTRAINT_TYPE AS "TIPO"
    FROM TABLE_CONSTRAINTS
    WHERE CONSTRAINT_SCHEMA = 'comercio';/*
+----------+------------+-------------+
| BANCO    | TABELA     | TIPO        |
+----------+------------+-------------+
| comercio | CLIENTE    | PRIMARY KEY |
| comercio | JOGADOR    | PRIMARY KEY |
| comercio | PESSOA     | UNIQUE      |
| comercio | PESSOA     | PRIMARY KEY |
| comercio | TELEFONE   | FOREIGN KEY |
| comercio | TIME       | PRIMARY KEY |
| comercio | TIME       | FOREIGN KEY |
| comercio | TIME       | FOREIGN KEY |
| comercio | TIMES      | PRIMARY KEY |
| comercio | TIMES      | FOREIGN KEY |
| comercio | produto    | PRIMARY KEY |
| comercio | vendedores | PRIMARY KEY |
+----------+------------+-------------+*/

SELECT CONSTRAINT_SCHEMA AS "BANCO",
    TABLE_NAME AS "TABELA",
    CONSTRAINT_NAME AS "NOME REGRA",
    CONSTRAINT_TYPE AS "TIPO"
    FROM TABLE_CONSTRAINTS
    WHERE CONSTRAINT_SCHEMA = 'comercio';/*
+----------+------------+---------------------+-------------+
| BANCO    | TABELA     | NOME REGRA          | TIPO        |
+----------+------------+---------------------+-------------+
| comercio | CLIENTE    | PRIMARY             | PRIMARY KEY |
| comercio | JOGADOR    | PRIMARY             | PRIMARY KEY |
| comercio | PESSOA     | COLUNA5             | UNIQUE      |
| comercio | PESSOA     | PRIMARY             | PRIMARY KEY |
| comercio | TELEFONE   | FK_CLIENTE_TELEFONE | FOREIGN KEY | -> NOME DADO A CONSTRAINT NA AULA ANTERIOR
| comercio | TIME       | PRIMARY             | PRIMARY KEY |
| comercio | TIME       | TIME_ibfk_1         | FOREIGN KEY |
| comercio | TIME       | TIME_ibfk_2         | FOREIGN KEY |
| comercio | TIMES      | PRIMARY             | PRIMARY KEY |
| comercio | TIMES      | TIMES_ibfk_1        | FOREIGN KEY |
| comercio | produto    | PRIMARY             | PRIMARY KEY |
| comercio | vendedores | PRIMARY             | PRIMARY KEY |
+----------+------------+---------------------+-------------+*/

/* APAGANDO CONSTRAINTS */
ALTER TABLE TELEFONE
    DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

