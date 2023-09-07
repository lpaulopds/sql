/*  OR: Para que a saída da query seja verdaedeira,
    basta que apenas uma condição seja verdadeira */

/*  AND: Para que a saída da query seja verdadeira,
    todas as condições da query precisam ser verdadeiras */

/*  Condição OR [ou]: */
	SELECT NOME, SEXO, ENDERECO
        FROM CLIENTE
    WHERE SEXO = 'M'
        OR ENDERECO LIKE '%RJ';

	SELECT NOME, SEXO, ENDERECO
        FROM CLIENTE
    WHERE SEXO = 'F'
        OR ENDERECO LIKE '%ESTACIO';

/*  Condição AND [e]: */
	SELECT NOME, SEXO, ENDERECO
        FROM CLIENTE
    WHERE SEXO = 'M'
        AND ENDERECO LIKE '%RJ';

	SELECT NOME, SEXO, ENDERECO
        FROM CLIENTE
    WHERE SEXO = 'F'
        AND ENDERECO LIKE '%ESTACIO';
