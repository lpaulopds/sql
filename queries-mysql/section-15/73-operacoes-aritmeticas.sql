/* OPERAÇÕES EM LINHA */
SELECT * FROM vendedores;

/* RELATÓRIO COM TOTAL E MÉDIA DE VENDAS DO TRIMESTRE */
SELECT nome AS NOME,
        janeiro AS JAN,
        fevereiro AS FEV,
        marco AS MAR,
        (janeiro+fevereiro+marco) AS "TOTAL",
        TRUNCATE((janeiro+fevereiro+marco)/3,2) AS "MEDIA"
            FROM vendedores;/*
+----------+------------+-----------+-----------+-------------+------------+
| NOME     | JAN        | FEV       | MAR       | TOTAL       | MEDIA      |
+----------+------------+-----------+-----------+-------------+------------+
| CARLOS   |   76234.78 |  42312.87 |  12354.90 |   130902.55 |   43634.18 |
| MARIA    |   24375.78 | 534532.88 |  86785.90 |   645694.55 |  215231.51 |
| ANTONIO  |   54352.78 |  13212.87 |  53456.90 |   121022.55 |   40340.84 |
| CLARA    |   79873.78 |  64564.87 |  53453.90 |   197892.55 |   65964.18 |
| ANDERSON |   53456.78 |  24346.87 |  42378.90 |   120182.55 |   40060.84 |
| IVONE    |   53457.78 |  64524.87 |   9876.90 |   127859.55 |   42619.85 |
| JOO      |  534536.75 | 534531.88 |  13267.90 |  1082336.53 |  360778.84 |
| CLIA     | 9879874.00 | 432464.88 | 868753.88 | 11181092.75 | 3727030.91 |
+----------+------------+-----------+-----------+-------------+------------+*/

/* APLICANDO UMA PORCENTAGEM PARA DESCONTO */
SELECT nome AS NOME,
        janeiro AS JAN,
        fevereiro AS FEV,
        marco AS MAR,
        (janeiro+fevereiro+marco) AS "TOTAL",
        (janeiro+fevereiro+marco) * .25 AS "DESCONTO",
        TRUNCATE((janeiro+fevereiro+marco)/3,2) AS "MEDIA"
            FROM vendedores;/*
+----------+------------+-----------+-----------+-------------+------------+------------+
| NOME     | JAN        | FEV       | MAR       | TOTAL       | DESCONTO   | MEDIA      |
+----------+------------+-----------+-----------+-------------+------------+------------+
| CARLOS   |   76234.78 |  42312.87 |  12354.90 |   130902.55 |   32725.64 |   43634.18 |
| MARIA    |   24375.78 | 534532.88 |  86785.90 |   645694.55 |  161423.64 |  215231.51 |
| ANTONIO  |   54352.78 |  13212.87 |  53456.90 |   121022.55 |   30255.64 |   40340.84 |
| CLARA    |   79873.78 |  64564.87 |  53453.90 |   197892.55 |   49473.14 |   65964.18 |
| ANDERSON |   53456.78 |  24346.87 |  42378.90 |   120182.55 |   30045.64 |   40060.84 |
| IVONE    |   53457.78 |  64524.87 |   9876.90 |   127859.55 |   31964.89 |   42619.85 |
| JOO      |  534536.75 | 534531.88 |  13267.90 |  1082336.53 |  270584.13 |  360778.84 |
| CLIA     | 9879874.00 | 432464.88 | 868753.88 | 11181092.75 | 2795273.19 | 3727030.91 |
+----------+------------+-----------+-----------+-------------+------------+------------+*/
