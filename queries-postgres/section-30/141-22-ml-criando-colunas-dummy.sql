/* VARIÁVEIS DUMMY PARA MACHINE LEARNING */

/* UTILIZANDO O CASE */
SELECT NOME, SEXO FROM FUNCIONARIOS;

SELECT NOME, CARGO FROM FUNCIONARIOS;

SELECT NOME, CARGO,
CASE
    WHEN CARGO = 'Financial Advisor' THEN 'CONDICAO 01'
    WHEN CARGO = 'Structural Engineer' THEN 'CONDICAO 02'
    WHEN CARGO = 'Executive Secretary' THEN 'CONDICAO 03'
    WHEN CARGO = 'Sales Associative' THEN 'CONDICAO 04'
    ELSE 'OUTRAS CONDICOES'
END AS "CONDICOES"
    FROM FUNCIONARIOS;
/*
    nome    |                cargo                 |    CONDICOES 
------------+--------------------------------------+------------------
 Kelley     | Structural Engineer                  | CONDICAO 02
 Armstrong  | Financial Advisor                    | CONDICAO 01
 Carr       | Recruiting Manager                   | OUTRAS CONDICOES
 Murray     | Desktop Support Technician           | OUTRAS CONDICOES
 Ellis      | Software Engineer III                | OUTRAS CONDICOES
 Phillips   | Executive Secretary                  | CONDICAO 03
 Williamson | Dental Hygienist                     | OUTRAS CONDICOES
 Harris     | Safety Technician I                  | OUTRAS CONDICOES
 James      | Sales Associate                      | OUTRAS CONDICOES
 Sanchez    | Sales Representative                 | OUTRAS CONDICOES
 Jacobs     | Community Outreach Specialist        | OUTRAS CONDICOES
 Black      | Data Coordiator                      | OUTRAS CONDICOES
 Schmidt    | Compensation Analyst                 | OUTRAS CONDICOES
 Webb       | Software Test Engineer III           | OUTRAS CONDICOES
 Jacobs     | Community Outreach Specialist        | OUTRAS CONDICOES
 Medina     | Web Developer III                    | OUTRAS CONDICOES
 Morgan     | Programmer IV                        | OUTRAS CONDICOES
 Nguyen     | Geologist II                         | OUTRAS CONDICOES
 Day        | VP Sales                             | OUTRAS CONDICOES
 Carr       | VP Quality Control                   | OUTRAS CONDICOES
 Bryant     | Software Consultant                  | OUTRAS CONDICOES
 Alexander  | Marketing Assistant                  | OUTRAS CONDICOES
 Chapman    | Senior Developer                     | OUTRAS CONDICOES
 Kelly      | Nurse Practicioner                   | OUTRAS CONDICOES
 Stephens   | Business Systems Development Analyst | OUTRAS CONDICOES
 Porter     | Dental Hygienist                     | OUTRAS CONDICOES
 Owens      | Executive Secretary                  | CONDICAO 03
 Scott      | Sales Representative                 | OUTRAS CONDICOES
 Price      | Quality Engineer                     | OUTRAS CONDICOES
 Weaver     | Account Representative III           | OUTRAS CONDICOES
--More-- */

SELECT CARGO FROM FUNCIONARIOS;

SELECT NOME,
CASE
    WHEN SEXO = 'Masculino' THEN 'M'
    ELSE 'F'
END AS "SEXO"
    FROM FUNCIONARIOS;
/*
    nome    | SEXO 
------------+------
 Kelley     | F
 Armstrong  | M
 Carr       | M
 Murray     | F
 Ellis      | F
 Phillips   | M
 Williamson | M
 Harris     | F
 James      | M
 Sanchez    | M
 Jacobs     | F
 Black      | M
 Schmidt    | M
 Webb       | F
 Jacobs     | F
 Medina     | F
 Morgan     | F
 Nguyen     | M
 Day        | M
 Carr       | F
 Bryant     | F
 Alexander  | M
 Chapman    | F
 Kelly      | M
 Stephens   | M
 Porter     | F
 Owens      | F
 Scott      | F
 Price      | F
 Weaver     | M
--More-- */

/* UTILIZANDO VALORES BOOLEANOS */
SELECT NOME, CARGO
    FROM FUNCIONARIOS;

SELECT NOME, CARGO, (SEXO = 'Masculino') AS Masculino, (SEXO = 'Feminino') AS Feminino
    FROM FUNCIONARIOS;
/*
    nome    |                cargo                 | masculino | feminino 
------------+--------------------------------------+-----------+----------
 Kelley     | Structural Engineer                  | f         | t
 Armstrong  | Financial Advisor                    | t         | f
 Carr       | Recruiting Manager                   | t         | f
 Murray     | Desktop Support Technician           | f         | t
 Ellis      | Software Engineer III                | f         | t
 Phillips   | Executive Secretary                  | t         | f
 Williamson | Dental Hygienist                     | t         | f
 Harris     | Safety Technician I                  | f         | t
 James      | Sales Associate                      | t         | f
 Sanchez    | Sales Representative                 | t         | f
 Jacobs     | Community Outreach Specialist        | f         | t
 Black      | Data Coordiator                      | t         | f
 Schmidt    | Compensation Analyst                 | t         | f
 Webb       | Software Test Engineer III           | f         | t
 Jacobs     | Community Outreach Specialist        | f         | t
 Medina     | Web Developer III                    | f         | t
 Morgan     | Programmer IV                        | f         | t
 Nguyen     | Geologist II                         | t         | f
 Day        | VP Sales                             | t         | f
 Carr       | VP Quality Control                   | f         | t
 Bryant     | Software Consultant                  | f         | t
 Alexander  | Marketing Assistant                  | t         | f
 Chapman    | Senior Developer                     | f         | t
 Kelly      | Nurse Practicioner                   | t         | f
 Stephens   | Business Systems Development Analyst | t         | f
 Porter     | Dental Hygienist                     | f         | t
 Owens      | Executive Secretary                  | f         | t
 Scott      | Sales Representative                 | f         | t
 Price      | Quality Engineer                     | f         | t
 Weaver     | Account Representative III           | t         | f
--More-- */

/* CONVERTENDO EM 0 E 1 */
SELECT NOME, CARGO,
CASE
    WHEN (SEXO = 'Masculino') = true THEN 1
    ELSE 0
END AS "MASCULINO",
CASE
    WHEN (SEXO = 'Feminino') = true THEN 1
    ELSE 0
END AS "FEMININO"
    FROM FUNCIONARIOS;
/*
    nome    |                cargo                 | MASCULINO | FEMININO 
------------+--------------------------------------+-----------+----------
 Kelley     | Structural Engineer                  |         0 |        1
 Armstrong  | Financial Advisor                    |         1 |        0
 Carr       | Recruiting Manager                   |         1 |        0
 Murray     | Desktop Support Technician           |         0 |        1
 Ellis      | Software Engineer III                |         0 |        1
 Phillips   | Executive Secretary                  |         1 |        0
 Williamson | Dental Hygienist                     |         1 |        0
 Harris     | Safety Technician I                  |         0 |        1
 James      | Sales Associate                      |         1 |        0
 Sanchez    | Sales Representative                 |         1 |        0
 Jacobs     | Community Outreach Specialist        |         0 |        1
 Black      | Data Coordiator                      |         1 |        0
 Schmidt    | Compensation Analyst                 |         1 |        0
 Webb       | Software Test Engineer III           |         0 |        1
 Jacobs     | Community Outreach Specialist        |         0 |        1
 Medina     | Web Developer III                    |         0 |        1
 Morgan     | Programmer IV                        |         0 |        1
 Nguyen     | Geologist II                         |         1 |        0
 Day        | VP Sales                             |         1 |        0
 Carr       | VP Quality Control                   |         0 |        1
 Bryant     | Software Consultant                  |         0 |        1
 Alexander  | Marketing Assistant                  |         1 |        0
 Chapman    | Senior Developer                     |         0 |        1
 Kelly      | Nurse Practicioner                   |         1 |        0
 Stephens   | Business Systems Development Analyst |         1 |        0
 Porter     | Dental Hygienist                     |         0 |        1
 Owens      | Executive Secretary                  |         0 |        1
 Scott      | Sales Representative                 |         0 |        1
 Price      | Quality Engineer                     |         0 |        1
 Weaver     | Account Representative III           |         1 |        0
--More-- */
