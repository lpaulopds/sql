/* ESTRUTURAS DE LOOP COM WHILE */
DECLARE 
    @I INT = 1
BEGIN
    WHILE (@I < 15)
    BEGIN
        PRINT 'VALOR DE @I: [+] ' + CAST(@I AS VARCHAR)
        SET @I = @I + 1
    END
END
GO/*
VALOR DE @I: [+] 1
VALOR DE @I: [+] 2
VALOR DE @I: [+] 3
VALOR DE @I: [+] 4
VALOR DE @I: [+] 5
VALOR DE @I: [+] 6
VALOR DE @I: [+] 7
VALOR DE @I: [+] 8
VALOR DE @I: [+] 9
VALOR DE @I: [+] 10
VALOR DE @I: [+] 11
VALOR DE @I: [+] 12
VALOR DE @I: [+] 13
VALOR DE @I: [+] 14*/
