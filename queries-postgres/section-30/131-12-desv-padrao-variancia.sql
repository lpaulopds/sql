/*
    DESVIO PADRÃO E VARIÂNCIA
    Desvio padrão: STDDEV_POP(coluna)
    Variância: VAR_POP(coluna)
*/
SELECT maquina,
    ROUND(AVG(qtd), 2) AS MEDIA,
    MAX(qtd) AS MAXIMO,
    MIN(qtd) AS MINIMO,
    MAX(qtd) - MIN(qtd) AS AMPLITUDE,
    ROUND(STDDEV_POP(qtd), 2) AS DESV_PAD,
    ROUND(VAR_POP(qtd), 2) AS VARIANCIA
    FROM maquinas
GROUP BY maquina
    ORDER BY 4 DESC;
/*
  maquina   | media | maximo | minimo | amplitude | desv_pad | variancia 
------------+-------+--------+--------+-----------+----------+-----------
 Maquina 02 | 17.80 |  43.00 |  14.50 |     28.50 |     8.40 |     70.61
 Maquina 03 | 15.00 |  25.00 |  10.00 |     15.00 |     4.47 |     20.00
 Maquina 01 | 15.00 |  35.00 |   0.00 |     35.00 |    11.16 |    124.60 */
