/* TRABALHANDO COM DATAS */

/* NUNCA TRABALHE COM '*' */
SELECT * FROM ALUNO
GO/*
IDALUNO     NOME                           SEXO NASCIMENTO       EMAIL                         
----------- ------------------------------ ---- ---------------- ------------------------------
          1 ANDRE                          M          1981-04-23 ANDRE@IG.COM                  
          2 ANA                            M          1943-03-21 ANA@IG.COM                    
          3 RUI                            M          1953-01-01 RUI@IG.COM                    
          5 JOAO                           M          1987-05-03 JOAO@IG.COM                   
          6 MARIA                          M          1997-02-05 MARIA@IG.COM                  */

SELECT NOME, NASCIMENTO 
    FROM ALUNO
GO/*
NOME                           NASCIMENTO      
------------------------------ ----------------
ANDRE                                1981-04-23
ANA                                  1943-03-21
RUI                                  1953-01-01
JOAO                                 1987-05-03
MARIA                                1997-02-05*/

/*
    DATEDIFF - CALCULA DIFERENÇA ENTRE DATAS
    EXISTE MAIS FUNÇÕES NO MSSQL PARA PESQUISAR
    APÓS O CURSO.
*/

/* FUNÇÃO GETDATE() TRAZ DIA E HORA */
SELECT NOME, GETDATE() AS DIA_HORA FROM ALUNO
GO/*
NOME                           DIA_HORA               
------------------------------ -----------------------
ANDRE                          2023-09-13 19:33:32.307
ANA                            2023-09-13 19:33:32.307
RUI                            2023-09-13 19:33:32.307
JOAO                           2023-09-13 19:33:32.307
MARIA                          2023-09-13 19:33:32.307*/

/*
    1º PASSO
    [UTILIZE SEMPRE [AS E ASPAS DUPLAS] NOS ALIASES]
*/
SELECT NOME, DATEDIFF(DAY, NASCIMENTO,GETDATE()) AS "IDADE"
    FROM ALUNO
GO/*
NOME                           IDADE      
------------------------------ -----------
ANDRE                                15483
ANA                                  29396
RUI                                  25822
JOAO                                 13282
MARIA                                 9716*/

/*
    2º PASSO
    RETORNO DE INTEIRO COM OPERAÇÃO MATEMÁTICA
*/
/* CALCULANDO IDADE EM DIAS [INTEIRO] */
SELECT NOME, (DATEDIFF(DAY, NASCIMENTO,GETDATE())/365) AS "IDADE"
    FROM ALUNO
GO/*
NOME                           IDADE      
------------------------------ -----------
ANDRE                                   42
ANA                                     80
RUI                                     70
JOAO                                    36
MARIA                                   26*/

/* CALCULANDO IDADE EM MESES [INTEIRO] */
SELECT NOME, (DATEDIFF(MONTH, NASCIMENTO,GETDATE())/12) AS "IDADE"
    FROM ALUNO
GO/*
NOME                           IDADE      
------------------------------ -----------
ANDRE                                   42
ANA                                     80
RUI                                     70
JOAO                                    36
MARIA                                   26*/

/* CALCULANDO IDADE EM ANOS [INTEIRO] */
SELECT NOME, DATEDIFF(YEAR, NASCIMENTO,GETDATE()) AS "IDADE"
    FROM ALUNO
GO/*
NOME                           IDADE      
------------------------------ -----------
ANDRE                                   42
ANA                                     80
RUI                                     70
JOAO                                    36
MARIA                                   26*/

/* FUNÇÃO GETNAME() TRAZ O NOME DO MÊS [STRING] */
SELECT NOME, DATENAME(MONTH, NASCIMENTO) AS "MES"
    FROM ALUNO
GO/*
NOME                           MES                           
------------------------------ ------------------------------
ANDRE                          April                         
ANA                            March                         
RUI                            January                       
JOAO                           May                           
MARIA                          February                      */

/* FUNÇÃO GETNAME() TRAZ O NOME DO DIA DA SEMANA [STRING] */
SELECT NOME, DATENAME(WEEKDAY, NASCIMENTO) AS "DAY"
    FROM ALUNO
GO/*
NOME                           DAY                           
------------------------------ ------------------------------
ANDRE                          Thursday                      
ANA                            Sunday                        
RUI                            Thursday                      
JOAO                           Sunday                        
MARIA                          Wednesday                     */

/* FUNÇÃO GETNAME() TRAZ O NOME DO ANO [STRING] */
SELECT NOME, DATENAME(YEAR, NASCIMENTO) AS "ANO"
    FROM ALUNO
GO/*
NOME                           ANO                           
------------------------------ ------------------------------
ANDRE                          1981                          
ANA                            1943                          
RUI                            1953                          
JOAO                           1987                          
MARIA                          1997                          */

/* FUNÇÃO DATEPART - RETORNA PARTES DE UMA DATA COMO INTEIRO */
SELECT NOME, DATEPART(MONTH, NASCIMENTO) AS "MÊS"
    FROM ALUNO
GO/*
NOME                           MÊS        
------------------------------ -----------
ANDRE                                    4
ANA                                      3
RUI                                      1
JOAO                                     5
MARIA                                    2*/

/* USANDO MAIS DE UMA FUNÇÃO NA MESMA QUERY */
SELECT NOME, DATEPART(MONTH, NASCIMENTO) AS "MÊS [INT]", DATENAME(MONTH, NASCIMENTO) AS "MÊS [STR]"
    FROM ALUNO
GO/*
NOME                           MÊS [INT]   MÊS [STR]                     
------------------------------ ----------- ------------------------------
ANDRE                                    4 April                         
ANA                                      3 March                         
RUI                                      1 January                       
JOAO                                     5 May                           
MARIA                                    2 February                      */

/*
    DATEADD - RETORNA UMA DATA SOMANDO A OUTRA DATA
        PARAMETROS:
            INTERVALO - DIA MES ANO
            INCREMENTO - ANO + 30 [O QUE, QUANDO]
            DATA - CALCULA ANO MAIS INCREMENTO COM A DATA DESCRITA
    IDEAL PARA CALCULAR PERÍODOS DE DATAS A VENCER
*/
SELECT DATEADD(DAY, 365, GETDATE())/*
-----------------------
2024-09-12 21:00:31.690*/
SELECT DATEADD(YEAR, 10, GETDATE())/*
-----------------------
2033-09-13 21:02:17.883*/






