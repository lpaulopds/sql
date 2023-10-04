/* SUBQUERIES */

/*  1º VENDEDOR QUE VENDEU MENOS NO MÊS DE MARÇO
    2º VENDEDOR QUE VENDEU MAIS NO MÊS DE MARÇO
    3º QUEM VENDEU MAIS QUE O VALOR MÉDIO DE FEVEREIRO */

/* QUERY INTUITIVAMENTE ERRADA */
SELECT nome, MIN(marco) AS MIN_VENDAS_MAR
    FROM vendedores;

/* 1º */
/* "FLOW" PARA CHEGAR NUMA SUBQUERY */
SELECT * FROM vendedores;
/* INNER QUERY É RESOLVIDA PRIMEIRO QUANDO UTILIZADA COMO UMA SUBQUERY */
SELECT MIN(marco) FROM vendedores;
SELECT nome, marco
    FROM vendedores
    WHERE marco = (SELECT MIN(marco) FROM vendedores);/*
                   INNER QUERY É RESOLVIDA PRIMEIRO 
+-------+---------+
| nome  | marco   |
+-------+---------+
| IVONE | 9876.90 |
+-------+---------+*/

/* 2º */
SELECT nome, marco
    FROM vendedores
    WHERE marco = (SELECT MAX(marco) FROM vendedores);/*
                   INNER QUERY É RESOLVIDA PRIMEIRO
+------+-----------+
| nome | marco     |
+------+-----------+
| CLIA | 868753.88 |
+------+-----------+*/

/* 3º */
SELECT nome, marco
    FROM vendedores
    WHERE marco > (SELECT AVG(marco) FROM vendedores);/*
                   INNER QUERY É RESOLVIDA PRIMEIRO
+------+-----------+
| nome | marco     |
+------+-----------+
| CLIA | 868753.88 |
+------+-----------+*/

/* VENDEDOR COM MAIOR MÉDIA DE VENDAS DE FEVEREIRO */
SELECT AVG(fevereiro) FROM vendedores;
SELECT nome, fevereiro
    FROM vendedores
    WHERE fevereiro > (SELECT AVG(fevereiro) FROM vendedores);/*
                       INNER QUERY É RESOLVIDA PRIMEIRO
+-------+-----------+
| nome  | fevereiro |
+-------+-----------+
| MARIA | 534532.88 |
| JOO   | 534531.88 |
| CLIA  | 432464.88 |
+-------+-----------+*/

/* VENDEDOR COM MENOR MÉDIA DE VENDAS DE FEVEREIRO */
SELECT nome, fevereiro
    FROM vendedores
    WHERE fevereiro < (SELECT AVG(fevereiro) FROM vendedores);/*
+----------+-----------+
| nome     | fevereiro |
+----------+-----------+
| CARLOS   |  42312.87 |
| ANTONIO  |  13212.87 |
| CLARA    |  64564.87 |
| ANDERSON |  24346.87 |
| IVONE    |  64524.87 |
+----------+-----------+*/
