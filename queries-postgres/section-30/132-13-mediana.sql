/* CÁLCULO DE VARIÂNCIA */
CREATE OR REPLACE FUNCTION _function_median(NUMERIC[])
    RETURNS NUMERIC AS
$$
    SELECT AVG(val)
    FROM (
        SELECT val
        FROM unnest($1) val
        ORDER BY 1
        LIMIT 2 - MOD(array_upper($1, 1), 2)
        OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
    ) sub;
$$
LANGUAGE 'sql' IMMUTABLE;

CREATE AGGREGATE median(NUMERIC) (
    SFUNC=array_append,
    STYPE=NUMERIC[],
    FINALFUNC=_function_median,
    INITCOND='{}'
);

/* MEDIANA DE TODAS AS MÁQUINAS */
SELECT median(qtd) as MEDIANA
    FROM maquinas;
/*
       mediana       
---------------------
 15.0000000000000000 */

/* MEDIANA DE CADA MÁQUINA */
SELECT median(qtd) as MEDIANA
    FROM maquinas
WHERE maquina = 'Maquina 01';
/*
       mediana       
---------------------
 15.0000000000000000 */

SELECT median(qtd) as MEDIANA
    FROM maquinas
WHERE maquina = 'Maquina 02';
/*
       mediana       
---------------------
 15.0000000000000000 */

SELECT median(qtd) as MEDIANA
    FROM maquinas
WHERE maquina = 'Maquina 03';
/*
       mediana       
---------------------
 15.0000000000000000 */
