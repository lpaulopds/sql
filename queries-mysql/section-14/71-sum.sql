/* AGREGANDO COM A FUNÇÃO SUM() */
SELECT SUM(JANEIRO) AS TOTAL_JAN
    FROM vendedores;/*
+-------------+
| TOTAL_JAN   |
+-------------+
| 10756162.44 |
+-------------+*/

SELECT SUM(janeiro) AS TOTAL_JAN,
        SUM(fevereiro) AS TOTAL_FEV,
        SUM(marco) AS TOTAL_MAR
        FROM vendedores;/*
+-------------+------------+------------+
| TOTAL_JAN   | TOTAL_FEV  | TOTAL_MAR  |
+-------------+------------+------------+
| 10756162.44 | 1710491.98 | 1140329.17 |
+-------------+------------+------------+*/

/* TOTAL DE VENDAS POR SEXO */
SELECT sexo, SUM(marco) AS TOTAL_MAR
    FROM vendedores
    GROUP BY sexo;/*
+------+------------+
| sexo | TOTAL_MAR  |
+------+------------+
| M    |  121458.60 |
| F    | 1018870.57 |
+------+------------+*/
