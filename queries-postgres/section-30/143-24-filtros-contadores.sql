/* MULTIPLOS CONTADORES */
/*
    NÃO FUNCIONA:
    SELECT
        COUNT(*) AS "QUANTIDADE TOTAL",
        COUNT('Masculino') AS "Masculino"
        FROM FUNCIONARIOS;
*/

SELECT COUNT(*) FROM FUNCIONARIOS;

SELECT SEXO, COUNT(*) AS "QTD"
    FROM FUNCIONARIOS
        WHERE SEXO = 'Masculino'
        GROUP BY SEXO;

/* FLOW */
/* PRIMEIRA TENTATIVA - ERRO DE SINTAXE */
SELECT COUNT(*) AS "QTD",
    COUNT(SELECT SEXO, COUNT(*)
    FROM FUNCIONARIOS
        WHERE SEXO = 'Masculino'
        GROUP BY SEXO) AS "Masc"
            FROM FUNCIONARIOS;
/*
ERROR:  syntax error at or near "SELECT"
LINE 2:     COUNT(SELECT SEXO, COUNT(*)
                  ^ */

/* SEGUNDA TENTATIVA - ERRO DE PROGRAMAÇÃO */
SELECT COUNT(*) AS "QTD",
    (SELECT SEXO, COUNT(*)
    FROM FUNCIONARIOS
        WHERE SEXO = 'Masculino'
        GROUP BY SEXO) AS "Masc"
            FROM FUNCIONARIOS;
/*
ERROR:  subquery must return only one column
LINE 2:     (SELECT SEXO, COUNT(*)
            ^ */

/* TERCEIRA TENTATIVA - FUNCIONA [DEGRADA PERFORMANCE] */
SELECT COUNT(*) AS "QTD",
    (SELECT COUNT(*)
    FROM FUNCIONARIOS
        WHERE SEXO = 'Masculino'
        GROUP BY SEXO) AS "Masc"
            FROM FUNCIONARIOS;
/*
 QTD  | Masc 
------+------
 1000 |  504
(1 row) */

/* MELHOR MANEIRA DE FILTRAR RESULTADOS - FILTER() */
SELECT COUNT(*) AS "QTD TOTAL",
    COUNT(*) FILTER(WHERE SEXO = 'Masculino') AS Masc
    FROM FUNCIONARIOS;
/*
 QTD TOTAL | masc 
-----------+------
      1000 |  504
(1 row) */

SELECT COUNT(*) AS "QTD TOTAL",
    COUNT(*) FILTER(WHERE SEXO = 'Masculino') AS "Masc",
    COUNT(*) FILTER(WHERE DEPARTAMENTO = 'Books') AS "Books"
    FROM FUNCIONARIOS;
/*
 QTD TOTAL | Masc | Books 
-----------+------+-------
      1000 |  504 |    47
(1 row) */

SELECT COUNT(*) AS "QTD TOTAL",
    COUNT(*) FILTER(WHERE SEXO = 'Masculino') AS "Masc",
    COUNT(*) FILTER(WHERE DEPARTAMENTO = 'Books') AS "Books",
    COUNT(*) FILTER(WHERE SALARIO > 140000) AS "Sal > 140"
    FROM FUNCIONARIOS;
/*
 QTD TOTAL | Masc | Books | Sal > 140 
-----------+------+-------+-----------
      1000 |  504 |    47 |       111
(1 row) */
