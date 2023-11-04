/*
    FUNÇÕES DE AGREGAÇÃO
*/

/* Query simples */
SELECT * FROM funcionarios;

/* Contando o número de ocorrências */
SELECT COUNT(*) FROM funcionarios;
/*
 count 
-------
  1000 */

SELECT COUNT(*) FROM localizacao;
/*
 count 
-------
     7 */

SELECT COUNT(*) FROM departamentos;
/*
count 
-------
    21 */

/* Agrupando por sexo com group by */
SELECT COUNT(*) FROM funcionarios
    GROUP BY sexo;
/*
 count 
-------
   504
   496 */

/* Colocando o nome da coluna */
SELECT SEXO, COUNT(*) FROM funcionarios
    GROUP BY sexo;
/*
   sexo    | count 
-----------+-------
 Masculino |   504
 Feminino  |   496 */

SELECT sexo, COUNT(*) AS "quantidade" FROM funcionarios
    GROUP BY sexo;
/*
   sexo    | quantidade 
-----------+------------
 Masculino |        504
 Feminino  |        496 */

/* Mostrando o número de funcionários por departamento */
SELECT departamento, COUNT(*)
    FROM funcionarios
    GROUP BY departamento;
/*
 departamento  | count 
---------------+-------
 Roupas        |    53
 Games         |    49
 Música       |    37
 Joalheria     |    46
 Jardim        |    47
 Esporte       |    40
 Calçados     |    43
 Books         |    47
 Computadores  |    52
 Ferramentas   |    39
 Outdoors      |    48
 Industrial    |    47
 Bebês        |    45
 Filmes        |    36
 Lar           |    52
 Crianças     |    38
 Beleza        |    53
 Automotivo    |    46
 Eletronicos   |    49
 Alimentícios |    46
 Brinquedos    |    41
 Saúde        |    46 */

/* Exibindo o máximo de salários */
SELECT MAX(salario) as "SALARIO MÁXIMO"
    FROM funcionarios;
/*
 SALARIO MÁXIMO 
-----------------
          149929 */

/* Exibindo o minímo de salários */
SELECT MIN(salario) as "SALARIO MÁXIMO"
    FROM funcionarios;
/*
 SALARIO MÁXIMO 
-----------------
           40138 */

/* Exibindo o máximo e mínimo juntos */
SELECT MIN(salario) AS "SALÁRIO MÍNIMO", MAX(salario) AS "SALÁRIO MÁXIMO"
    FROM funcionarios;
/*
 SALÁRIO MÍNIMO | SALÁRIO MÁXIMO 
------------------+------------------
            40138 |           149929 */


/* Exibindo o salário máximo e mínimo de cada departamento */
    /* Tem que agrupar com o nome da coluna que está na seleção */
SELECT departamento, MIN(salario), MAX(salario)
    FROM funcionarios
    GROUP BY departamento;
/*
 departamento  |  min  |  max   
---------------+-------+--------
 Roupas        | 42797 | 148408
 Games         | 41516 | 149221
 Música       | 42759 | 144608
 Joalheria     | 41026 | 149114
 Jardim        | 50057 | 148860
 Esporte       | 40418 | 147166
 Calçados     | 45463 | 147739
 Books         | 42714 | 146745
 Computadores  | 46960 | 149336
 Ferramentas   | 44788 | 149586
 Outdoors      | 43366 | 148906
 Industrial    | 40194 | 148816
 Bebês        | 42924 | 148687
 Filmes        | 41898 | 146970
 Lar           | 40415 | 149598
 Crianças     | 43097 | 149351
 Beleza        | 40254 | 149099
 Automotivo    | 42602 | 146167
 Eletronicos   | 40218 | 149597
 Alimentícios | 44919 | 149929
 Brinquedos    | 40138 | 149835
 Saúde        | 43431 | 145962 */

 /* Exibindo o salário máximo e mínimo de cada sexo */
SELECT sexo, MIN(salario), MAX(salario)
    FROM funcionarios
    GROUP BY sexo;
/*
   sexo    |  min  |  max   
-----------+-------+--------
 Masculino | 40194 | 149835
 Feminino  | 40138 | 149929 */
