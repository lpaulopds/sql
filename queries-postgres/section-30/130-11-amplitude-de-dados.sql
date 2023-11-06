/* MODA DO DATASET INTEIRO */
SELECT qtd, COUNT(*) AS moda
    FROM maquinas
GROUP BY qtd
    ORDER BY 2 DESC;
/*
  qtd  | moda 
-------+------
 15.00 |   12
 25.00 |    3
 10.00 |    3
  1.00 |    2
 20.00 |    2
  0.00 |    1
 15.50 |    1
 14.50 |    1
 35.00 |    1
 13.00 |    1
 15.10 |    1
 14.90 |    1
 43.00 |    1 */

/* QUAL O MÁXIMO, MÍNIMO E AMPLITUDE DE CADA MÁQUINA */
SELECT maquina,
    MAX(qtd) AS MAXIMO,
    MIN(qtd) AS MINIMO,
    MAX(qtd) - MIN(qtd) AS AMPLITUDE
    FROM maquinas
GROUP BY maquina
    ORDER BY 4 DESC;
/*
  maquina   | maximo | minimo | amplitude 
------------+--------+--------+-----------
 Maquina 01 |  35.00 |   0.00 |     35.00
 Maquina 02 |  43.00 |  14.50 |     28.50
 Maquina 03 |  25.00 |  10.00 |     15.00 */

/* ADICIONANDO MÉDIA AO RELATÓRIO */
SELECT maquina,
    ROUND(AVG(qtd), 2) AS MEDIA,
    MAX(qtd) AS MAXIMO,
    MIN(qtd) AS MINIMO,
    MAX(qtd) - MIN(qtd) AS AMPLITUDE
    FROM maquinas
GROUP BY maquina
    ORDER BY 4 DESC;
/*
  maquina   | media | maximo | minimo | amplitude 
------------+-------+--------+--------+-----------
 Maquina 02 | 17.80 |  43.00 |  14.50 |     28.50
 Maquina 03 | 15.00 |  25.00 |  10.00 |     15.00
 Maquina 01 | 15.00 |  35.00 |   0.00 |     35.00 */
