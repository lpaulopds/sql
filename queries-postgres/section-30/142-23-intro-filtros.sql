/*
    FILTROS DE GRUPO
*/

/* FILTROS BASEADOS EM VALORES NÚMERICOS */
SELECT NOME, DEPARTAMENTO, SALARIO
    FROM FUNCIONARIOS
        WHERE SALARIO > 100000;
/*
   nome    | departamento  | salario 
-----------+---------------+---------
Carr       | Automotivo    |  101768
Phillips   | Ferramentas   |  118497
James      | Joalheria     |  108657
Sanchez    | Filmes        |  108093
Jacobs     | Joalheria     |  121966
Jacobs     | Games         |  141139
Medina     | Bebês        |  106659
Morgan     | Crianças     |  148952
Day        | Eletronicos   |  109890
Carr       | Filmes        |  115274
Alexander  | Automotivo    |  144724
Chapman    | Joalheria     |  126103
Kelly      | Jardim        |  144965
Willis     | Ferramentas   |  113507
Reed       | Filmes        |  120579
Bradley    | Outdoors      |  107222
Watkins    | Computadores  |  125668
Simmons    | Filmes        |  113857
Nguyen     | Automotivo    |  108378
Lawrence   | Outdoors      |  133424
Johnson    | Computadores  |  134940
Crawford   | Lar           |  119471
Dixon      | Bebês        |  106281
Snyder     | Crianças     |  141678
Coleman    | Computadores  |  110839
Lane       | Outdoors      |  104896
Young      | Alimentícios |  138844
Cooper     | Jardim        |  139796
Rodriguez  | Beleza        |  141949
Mills      | Alimentícios |  114200
-More-- */

SELECT NOME, DEPARTAMENTO
    FROM FUNCIONARIOS
        WHERE SALARIO > 100000;
/*
    nome    | departamento  
------------+---------------
 Carr       | Automotivo
 Phillips   | Ferramentas
 James      | Joalheria
 Sanchez    | Filmes
 Jacobs     | Joalheria
 Jacobs     | Games
 Medina     | Bebês
 Morgan     | Crianças
 Day        | Eletronicos
 Carr       | Filmes
 Alexander  | Automotivo
 Chapman    | Joalheria
 Kelly      | Jardim
 Willis     | Ferramentas
 Reed       | Filmes
 Bradley    | Outdoors
 Watkins    | Computadores
 Simmons    | Filmes
 Nguyen     | Automotivo
 Lawrence   | Outdoors
 Johnson    | Computadores
 Crawford   | Lar
 Dixon      | Bebês
 Snyder     | Crianças
 Coleman    | Computadores
 Lane       | Outdoors
 Young      | Alimentícios
 Cooper     | Jardim
 Rodriguez  | Beleza
 Mills      | Alimentícios
--More-- */

/* FILTROS BASEADOS EM STRINGS */
/* a string de busca da query é case sensitive */
SELECT NOME, DEPARTAMENTO, SALARIO
    FROM FUNCIONARIOS
        WHERE DEPARTAMENTO = 'Ferramentas';
/*
    nome    | departamento | salario 
------------+--------------+---------
 Phillips   | Ferramentas  |  118497
 Willis     | Ferramentas  |  113507
 Watson     | Ferramentas  |   81870
 Daniels    | Ferramentas  |  139061
 Gomez      | Ferramentas  |  103806
 Gutierrez  | Ferramentas  |   58805
 Harvey     | Ferramentas  |  138179
 Thomas     | Ferramentas  |  128239
 Johnston   | Ferramentas  |   87072
 Jenkins    | Ferramentas  |  113599
 Frazier    | Ferramentas  |   88470
 Harris     | Ferramentas  |  148940
 Henry      | Ferramentas  |   95583
 Bishop     | Ferramentas  |  110744
 Ferguson   | Ferramentas  |  119385
 Mason      | Ferramentas  |  120160
 Payne      | Ferramentas  |   94016
 Perez      | Ferramentas  |   73412
 Day        | Ferramentas  |  129890
 Henderson  | Ferramentas  |  101937
 Cole       | Ferramentas  |  133190
 Perez      | Ferramentas  |   44788
 Rodriguez  | Ferramentas  |   77005
 Webb       | Ferramentas  |  143595
 Williams   | Ferramentas  |  107709
 Dixon      | Ferramentas  |   60383
 Gonzalez   | Ferramentas  |  131830
 Williamson | Ferramentas  |  135695
 Allen      | Ferramentas  |  149586
 Hanson     | Ferramentas  |  113354
--More-- */

/* FILTROS BASEADOS EM MULTIPLAS TIPOS E COLUNAS - [OR][AND] */
SELECT NOME, DEPARTAMENTO, SALARIO
    FROM FUNCIONARIOS
        WHERE DEPARTAMENTO = 'Ferramentas'
        AND SALARIO > 100000;
/*
    nome    | departamento | salario 
------------+--------------+---------
 Phillips   | Ferramentas  |  118497
 Willis     | Ferramentas  |  113507
 Daniels    | Ferramentas  |  139061
 Gomez      | Ferramentas  |  103806
 Harvey     | Ferramentas  |  138179
 Thomas     | Ferramentas  |  128239
 Jenkins    | Ferramentas  |  113599
 Harris     | Ferramentas  |  148940
 Bishop     | Ferramentas  |  110744
 Ferguson   | Ferramentas  |  119385
 Mason      | Ferramentas  |  120160
 Day        | Ferramentas  |  129890
 Henderson  | Ferramentas  |  101937
 Cole       | Ferramentas  |  133190
 Webb       | Ferramentas  |  143595
 Williams   | Ferramentas  |  107709
 Gonzalez   | Ferramentas  |  131830
 Williamson | Ferramentas  |  135695
 Allen      | Ferramentas  |  149586
 Hanson     | Ferramentas  |  113354
 Hill       | Ferramentas  |  144661
 Frazier    | Ferramentas  |  104326
 Cole       | Ferramentas  |  116766 */

/* FILTRO BASEADO EM ÚNICO TIPO E COLUNA - ATENÇÃO A REGRA DO [AND][OR] */
/*
    O FILTRO [AND] NÃO FUNCIONA EM RELACIONAMENTOS 1x1,
    ONDE POR EXEMPLO, SE BUSCA DUAS STRINGS NA MESMA
    COLUNA:
        SELECT NOME, DEPARTAMENTO, SALARIO
        FROM FUNCIONARIOS
            WHERE DEPARTAMENTO = 'Ferramentas'
            AND DEPARTAMENTO = 'Books';
         nome | departamento | salario 
        ------+--------------+---------
        (0 rows)
*/

SELECT NOME, DEPARTAMENTO, SALARIO
    FROM FUNCIONARIOS
        WHERE DEPARTAMENTO = 'Ferramentas'
        OR DEPARTAMENTO = 'Books';


/* FILTROS BASEADOS EM PADRÃO DE CARACTERES */
SELECT DEPARTAMENTO, sum(salario) as "TOTAL"
    FROM FUNCIONARIOS
    WHERE DEPARTAMENTO LIKE 'B%'
        GROUP BY DEPARTAMENTO;
/*
 departamento |  TOTAL  
--------------+---------
 Books        | 4459837
 Bebês       | 4218724
 Beleza       | 5481063
 Brinquedos   | 3943674
(4 rows) */


/* FILTROS BASEADOS EM PADRÃO DE CARACTERES COM MAIS LETRAS */
SELECT DEPARTAMENTO, sum(salario) as "TOTAL"
    FROM FUNCIONARIOS
    WHERE DEPARTAMENTO LIKE 'Be%'
        GROUP BY DEPARTAMENTO;
/*
 departamento |  TOTAL  
--------------+---------
 Bebês       | 4218724
 Beleza       | 5481063
(2 rows) */

/* FILTROS BASEADOS EM CARACTER CORINGA NO MEIO DA PALAVRA */
SELECT DEPARTAMENTO, sum(salario) as "TOTAL"
    FROM FUNCIONARIOS
    WHERE DEPARTAMENTO LIKE 'B%s'
        GROUP BY DEPARTAMENTO;
/*
 departamento |  TOTAL  
--------------+---------
 Books        | 4459837
 Bebês       | 4218724
 Brinquedos   | 3943674
(3 rows) */

/* AGRUPAR POR DEPARTAMENTO COM SALÁRIO MAIOR QUE 40000000 */
/*
    NÃO ESQUECER:
        - COLUNAS NÃO AGREGADAS - [WHERE]
        - COLUNAS AGREGADAS - [HAVING]

    NÃO FUNCIONA:
        SELECT DEPARTAMENTO, sum(salario) as "TOTAL"
            FROM FUNCIONARIOS
                WHERE DEPARTAMENTO LIKE 'B%' AND SUM(SALARIO) > 40000000
                GROUP BY DEPARTAMENTO;
        
*/
SELECT DEPARTAMENTO, SUM(SALARIO) AS "TOTAL"
    FROM FUNCIONARIOS
        WHERE DEPARTAMENTO LIKE 'B%'
            GROUP BY DEPARTAMENTO
            HAVING SUM(SALARIO) > 4000000;
/*
 departamento |  TOTAL  
--------------+---------
 Books        | 4459837
 Bebês       | 4218724
 Beleza       | 5481063
(3 rows) */
