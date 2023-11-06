/* Importar e analisar arquivo csv gerado pelo servidor. */

/* Importar CSV */
CREATE TABLE MAQUINAS(
    MAQUINA VARCHAR(10),
    DIA INT,
    QTD NUMERIC(10,2)
);

/*
    os logs das maquinas foram inseridos com PHP,
    veja a classe InsertionsIntoTables e o arquivo
    index.php
*/
COPY MAQUINAS
FROM 'C:\Users\luizp\Downloads\LogMaquinas.csv'
DELIMITER ','
CSV HEADER;

/* MÉDIA DE CADA MÁQUINA */
SELECT maquina, AVG(qtd) AS MEDIA_QTD
    FROM maquinas
GROUP BY maquina
    ORDER BY 2 DESC;
/*
  maquina   |      media_qtd      
------------+---------------------
 Maquina 02 | 17.8000000000000000
 Maquina 01 | 15.0000000000000000
 Maquina 03 | 15.0000000000000000 */

/* ARREDONDANDO COM ROUND - ROUND(COLUNA,2) */
SELECT maquina, ROUND(AVG(qtd),2) AS MEDIA_QTD
    FROM maquinas
GROUP BY maquina
    ORDER BY 2 DESC;
/*
  maquina   | media_qtd 
------------+-----------
 Maquina 02 |     17.80
 Maquina 01 |     15.00
 Maquina 03 |     15.00 */

/* MODA DAS QUANTIDADES DAS MAQUINA */
SELECT maquina, qtd, count(*) as MODA
    FROM maquinas
GROUP BY maquina, qtd
    ORDER BY 3 DESC;
/*
  maquina   |  qtd  | moda 
------------+-------+------
 Maquina 03 | 15.00 |    5
 Maquina 02 | 15.00 |    5
 Maquina 03 | 10.00 |    3
 Maquina 01 |  1.00 |    2
 Maquina 01 | 15.00 |    2
 Maquina 01 | 25.00 |    2
 Maquina 01 | 20.00 |    1
 Maquina 01 | 13.00 |    1
 Maquina 02 | 14.50 |    1
 Maquina 01 | 35.00 |    1
 Maquina 02 | 43.00 |    1
 Maquina 02 | 15.50 |    1
 Maquina 03 | 20.00 |    1
 Maquina 02 | 15.10 |    1
 Maquina 03 | 25.00 |    1
 Maquina 01 |  0.00 |    1
 Maquina 02 | 14.90 |    1 */

/* MODA DAS QUANTIDADES DE CADA MAQUINA */
SELECT maquina, qtd, COUNT(*) FROM maquinas
    WHERE maquina = 'Maquina 01'
GROUP BY maquina, qtd
    ORDER BY 3 DESC
    LIMIT 1;
/*
  maquina   | qtd  | count 
------------+------+-------
 Maquina 01 | 1.00 |     2 */


