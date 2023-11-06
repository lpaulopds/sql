/*
    COEFICIENTE DE VARIAÇÃO
    FUNÇÃO E ANÁLISE DA MEDIANA
    - quantidade
    - total
    - média
    - máximo
    - mínimo
    - amplitude
    - variância
    - desvio padrão
    - mediana
    - coeficiente de variação
*/
SELECT maquina,
    COUNT(qtd) AS "QUANTIDADE",
    SUM(qtd) AS "TOTAL",
    ROUND(AVG(qtd), 2) AS "MEDIA",
    MAX(qtd) AS "MAXIMO",
    MIN(qtd) AS "MINIMO",
    ROUND(VAR_POP(qtd), 2) AS "VARIANCIA",
    ROUND(STDDEV_POP(qtd), 2) AS "DESVIO PADRAO",
    ROUND(median(qtd), 2) AS "MEDIANA",
    ROUND(STDDEV_POP(qtd) / AVG(qtd) * 100, 2) AS "COEF. VARIACAO"
        FROM maquinas
    GROUP BY maquina
ORDER BY 1;
/*
  maquina   | QUANTIDADE | TOTAL  | MEDIA | MAXIMO | MINIMO | VARIANCIA | DESVIO PADRAO | MEDIANA | COEF. VARIACAO 
------------+------------+--------+-------+--------+--------+-----------+---------------+---------+----------------
 Maquina 01 |         12 | 180.90 | 15.08 |  35.00 |   0.00 |    103.90 |         10.19 |   15.00 |          67.61
 Maquina 02 |         12 | 208.40 | 17.37 |  43.00 |  14.50 |     59.79 |          7.73 |   15.00 |          44.52
 Maquina 03 |         12 | 180.70 | 15.06 |  25.00 |  10.00 |     16.70 |          4.09 |   15.00 |          27.14 */

