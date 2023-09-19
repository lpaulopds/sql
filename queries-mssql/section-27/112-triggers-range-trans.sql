/* TRIGGERS DE RANGE E INTRODOUÇÃO A TRANSAÇÕES */
CREATE TABLE SALARIO_RANGE(
    MINSAL MONEY,
    MAXSAL MONEY
)
GO

INSERT INTO SALARAIO_RANGE VALUES (3000.00, 6000.00)
GO

/* TRIGGERS PODEM SER CRIADAS COM MAIS DE UMA FUNÇÃO */
CREATE TRIGGER TG_RANGE
ON DBO.EMPREGADO
FOR INSERT, UPDATE
AS
    --declarando as variáveis
    DECLARE
        @MINSAL MONEY,
        @MAXSAL MONEY,
        @ATUALSAL MONEY
    
    --setando as variáveis com SELECT
    SELECT @MINSAL = MINSAL, @MAXSAL = MAXSAL FROM SALARIO_RANGE

    -- seleciona novo salario e configura variável com esse novo valor
    SELECT @ATUALSAL = I.SALARIO
        FROM INSERTED I

    --condição do trigger
    IF(@ATUALSAL < @MINSAL)
    BEGIN
        RAISERROR('SALÁRIO MENOR QUE O PISO', 16, 1)
        ROLLBACK TRANSACTION
    END

    --condição do trigger
    IF(@ATUALSAL > @MAXSAL)
    BEGIN
        RAISERROR('SALÁRIO MAIOR QUE O TETO', 16, 1)
        ROLLBACK TRANSACTION
    END
GO

/* TESTANDO O TRIGGER COM UPDATE */
UPDATE EMPREGADO SET SALARIO = 9000.00
WHERE IDEMP = 1
GO/*
(1 rows affected)
Msg 50000, Level 16, State 1, Server b984b9111f23, Procedure TG_RANGE, Line 19
SALÁRIO MAIOR QUE O TETO
Msg 3609, Level 16, State 1, Server b984b9111f23, Line 1
The transaction ended in the trigger. The batch has been aborted.*/
/* A FUNÇÃO ROLLBACK É COM O COMANDO [CTRL-Z] */

/* VERIFICA SCRIPT DO TRIGGER */
SP_HELPTEXT TG_RANGE
GO

