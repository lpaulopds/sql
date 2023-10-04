/* FUNÇÕES DE AGREGAÇÃO NÚMERICAS */

CREATE TABLE vendedores (
    idvendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    sexo CHAR(1),
    janeiro FLOAT(10,2),
    fevereiro FLOAT(10,2),
    marco FLOAT(10,2)
);

INSERT INTO vendedores VALUES(NULL, 'CARLOS', 'M', 76234.78, 42312.87, 12354.90);
INSERT INTO vendedores VALUES(NULL, 'MARIA', 'F', 24375.78, 534532.87, 86785.90);
INSERT INTO vendedores VALUES(NULL, 'ANTONIO', 'M', 54352.78, 13212.87, 53456.90);
INSERT INTO vendedores VALUES(NULL, 'CLARA', 'F', 79873.78, 64564.87, 53453.90);
INSERT INTO vendedores VALUES(NULL, 'ANDERSON', 'M', 53456.78, 24346.87, 42378.90);
INSERT INTO vendedores VALUES(NULL, 'IVONE', 'F', 53457.78, 64524.87, 09876.90);
INSERT INTO vendedores VALUES(NULL, 'JOÃO', 'M', 534536.78, 534531.87, 13267.90);
INSERT INTO vendedores VALUES(NULL, 'CÉLIA', 'F', 9879873.78, 432464.87, 868753.90);

/* MAX - TRAZ O VALOR MÁXIMO DE UMA COLUNA */
SELECT MAX(fevereiro) AS MAIOR_FEV
    FROM vendedores;/*
+-----------+
| MAIOR_FEV |
+-----------+
| 534532.88 |
+-----------+*/

/* MIN - TRAZ O VALOR MÍNIMO DE UNA COLUNA */
SELECT MIN(fevereiro) AS MINIMO_FEV
    FROM vendedores;/*
+-----------+
| MINIMO_FEV |
+-----------+
|  13212.87 |
+-----------+*/

/* AVG - TRAZ O VALOR MÉDIO DE UMA COLUNA */
SELECT AVG(fevereiro) AS MEDIA_FEV
    FROM vendedores;/*
+---------------+
| MEDIA_FEV     |
+---------------+
| 213811.497192 |
+---------------+*/

/* VÁRIAS FUNÇÕES NA MESMA QUERY */
SELECT MAX(janeiro) AS MAX_JAN,
        MIN(janeiro) AS MIN_JAN,
        AVG(janeiro) AS MED_JAN
        FROM vendedores;/*
+------------+----------+----------------+
| MAX_JAN    | MIN_JAN  | MED_JAN        |
+------------+----------+----------------+
| 9879874.00 | 24375.78 | 1344520.304443 |
+------------+----------+----------------+*/

/* TRUNCATE(NUMERO,QUANTIDADE) */
SELECT MAX(janeiro) AS MAX_JAN,
        MIN(janeiro) AS MIN_JAN,
        TRUNCATE(AVG(janeiro),2) AS MED_JAN
        FROM vendedores;/*
+------------+----------+-----------+
| MAX_JAN    | MIN_JAN  | MED_JAN   |
+------------+----------+-----------+
| 9879874.00 | 24375.78 | 1344520.3 |
+------------+----------+-----------+*/
