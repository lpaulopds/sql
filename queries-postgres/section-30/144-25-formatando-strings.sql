/* FORMANTANDO STRINGS */
SELECT DEPARTAMENTO FROM FUNCIONARIOS;

SELECT DISTINCT DEPARTAMENTO FROM FUNCIONARIOS;
/*
 departamento  
---------------
 Roupas
 Games
 Música
 Joalheria
 Jardim
 Esporte
 Calçados
 Books
 Computadores
 Ferramentas
 Outdoors
 Industrial
 Bebês
 Filmes
 Lar
 Crianças
 Beleza
 Automotivo
 Eletronicos
 Alimentícios
 Brinquedos
 Saúde
(22 rows) */

/* UPPER CASE */
SELECT DISTINCT UPPER(DEPARTAMENTO) FROM FUNCIONARIOS;

/* LOWER CASE */
SELECT DISTINCT LOWER(DEPARTAMENTO) FROM FUNCIONARIOS;

/* CONCATENANDO STRINGS */
SELECT CARGO || ' - ' || DEPARTAMENTO AS "COLUMN"
    FROM FUNCIONARIOS;
/*
                        COLUMN                       
-----------------------------------------------------
 Structural Engineer - Computadores
 Financial Advisor - Esporte
 Recruiting Manager - Automotivo
 Desktop Support Technician - Joalheria
 Software Engineer III - Alimentícios
 Executive Secretary - Ferramentas
 Dental Hygienist - Computadores
 Safety Technician I - Brinquedos
 Sales Associate - Joalheria
 Sales Representative - Filmes
 Community Outreach Specialist - Joalheria
 Data Coordiator - Roupas
 Compensation Analyst - Bebês
 Software Test Engineer III - Computadores
 Community Outreach Specialist - Games
 Web Developer III - Bebês
 Programmer IV - Crianças
 Geologist II - Lar
 VP Sales - Eletronicos
 VP Quality Control - Filmes
 Software Consultant - Industrial
 Marketing Assistant - Automotivo
 Senior Developer - Joalheria
 Nurse Practicioner - Jardim
 Business Systems Development Analyst - Brinquedos
 Dental Hygienist - Lar
 Executive Secretary - Lar
 Sales Representative - Books
 Quality Engineer - Roupas
 Account Representative III - Beleza
--More-- */

/* CONCATENADO COM UPPER CASE */
SELECT UPPER(CARGO || ' - ' || DEPARTAMENTO) AS "COLUMN"
    FROM FUNCIONARIOS;

/* REMOVENDO ESPAÇOS */

/* PROJEÇÃO COM ESPAÇOS */
SELECT '  UNIDADOS    ';

/* CONTANDO CARACTERES */
SELECT LENGTH ('   UNIDADOS    ');
/*
 length 
--------
     15
(1 row) */

/* REMOVE ESPAÇOS EM BRANCO */
SELECT TRIM('   UNIDADOS    ');

/* PROJETAR CARGO INFORMANDO SE É ASSISTENTE OU NÃO */
SELECT * FROM FUNCIONARIOS;

SELECT NOME, (CARGO LIKE '%Assistant%') AS "ASSISTENTE"
    FROM FUNCIONARIOS;
/*
    nome    | ASSISTENTE 
------------+------------
 Kelley     | f
 Armstrong  | f
 Carr       | f
 Murray     | f
 Ellis      | f
 Phillips   | f
 Williamson | f
 Harris     | f
 James      | f
 Sanchez    | f
 Jacobs     | f
 Black      | f
 Schmidt    | f
 Webb       | f
 Jacobs     | f
 Medina     | f
 Morgan     | f
 Nguyen     | f
 Day        | f
 Carr       | f
 Bryant     | f
 Alexander  | t
 Chapman    | f
 Kelly      | f
 Stephens   | f
 Porter     | f
 Owens      | f
 Scott      | f
 Price      | f
 Weaver     | f
--More-- */

SELECT NOME,
    CASE WHEN (CARGO LIKE '%Assistant%') = TRUE THEN 1
    ELSE 0
    END AS "ASSISTENTE"
        FROM FUNCIONARIOS;
/*
    nome    | ASSISTENTE 
------------+------------
 Kelley     | 0
 Armstrong  | 0
 Carr       | 0
 Murray     | 0
 Ellis      | 0
 Phillips   | 0
 Williamson | 0
 Harris     | 0
 James      | 0
 Sanchez    | 0
 Jacobs     | 0
 Black      | 0
 Schmidt    | 0
 Webb       | 0
 Jacobs     | 0
 Medina     | 0
 Morgan     | 0
 Nguyen     | 0
 Day        | 0
 Carr       | 0
 Bryant     | 0
 Alexander  | 1
 Chapman    | 0
 Kelly      | 0
 Stephens   | 0
 Porter     | 0
 Owens      | 0
 Scott      | 0
 Price      | 0
 Weaver     | 0
--More-- */
