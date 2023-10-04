/* [117] TRABALHANDO COM ESTRUTURAS CONDICIONAIS */
DECLARE
    @NUMERO INT = 5
BEGIN
    IF @NUMERO = 5 --EXPRESSÃO BOOLEANA - TRUE
        PRINT 'O VALOR É VERDADEIRO'
    ELSE
        PRINT 'O VALOR É FALSO'
END
GO

/* FUNÇÃO CASE */
DECLARE
    @CONTADOR INT
BEGIN
    SELECT -- O CASE REPRESENTA UMA COLUNA
    CASE
        WHEN FABRICANTE = 'FIAT' THEN 'FAIXA 1'
        WHEN FABRICANTE = 'CHEVROLET' THEN 'FAIXA 2'
            ELSE 'OUTRAS FAIXAS'
        END AS "INFORMAÇÕES",
        *
        FROM CARROS
END
GO/*
INFORMAÇÕES   CARRO                FABRICANTE 
------------- -------------------- -----------
OUTRAS FAIXAS KA                   FORD       
OUTRAS FAIXAS FIESTA               FORD       
OUTRAS FAIXAS PRISMA               FORD       
OUTRAS FAIXAS CLIO                 RENAULT    
OUTRAS FAIXAS SANDEIRO             RENAULT    
FAIXA 2       CHEVETE              CHEVROLET  
FAIXA 2       OMEGA                CHEVROLET  
FAIXA 1       PALIO                FIAT       
FAIXA 1       DOBLO                FIAT       
FAIXA 1       UNO                  FIAT       
OUTRAS FAIXAS GOL                  VOLKSWAGEN */

/*
    Ps.: O CASE PODE SER USADO FORA OU DENTRO
    DE UM BLOCO DE PROGRAMAÇÃO
*/
