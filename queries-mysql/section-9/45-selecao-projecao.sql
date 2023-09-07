/*  PROJEÇÃO */
/*  É tudo que é projetado na tela. */ 
    SELECT NOW();
    SELECT NOW() AS DATA_ATUAL;
    SELECT 2 + 2 AS SOMA, NOME, NOW() FROM CLIENTE;

/*  SELEÇÃO */
/*  É um subconjunto de um total de registros de uma tabela. */
/*  A clausula de seleção é o WHERE. */
    SELECT NOME, SEXO, EMAIL # projeção
        FROM CLIENTE # "origem"
            WHERE SEXO = 'F'; # filtro (seleção)
