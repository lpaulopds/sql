/*  Exercício livraria */

/*  - Banco de dados apenas para os livros comercializados.
	- Existe uma tabela de excel utilizada po rum funcionário de vendas
	  mas, as buscas estão ficando complexas.
	- O banco de dados é apenas para o funcionário de vendas */

/*  É preciso entregar algumas queries prontas para o desenvolvedor */
	
/*	1 - Trazer todos os dados.
	2 - Trazer o nome do livro e editora.
	3 - Trazer o nome do livro do livro
	    e a UF dos livros publicados por
	    autores do sexo masculno.
	4 - Trazer o nome do livro e o número
	    de páginas do autores do sexo feminino
	5 - Trazer od valores dos livros das
	    editoras do estado de São Paulo.
	6 - Trazer os dados dos autores do sexo
	    masculino que tiveram livros publicados
	    por São Paulo ou Rio de Janeiro */

/*  REQUISITOS: */
/*	Banco de dados: LIVRARIA
	Tabela: LIVROS */

/*  ATRIBUTOS DA TABELA: */
/*	Nome do livro
	Nome do autor
	Sexo do autor
	Número de páginas
	Nome da editora
	Valor dos livros
	Estado UF da editora
	Ano publicado */

/*  DADOS PARA TESTES: */
/*	LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO */
    ('Cavaleiro Real','Ana Claudia','F',465,'ATLAS',49,9,'RJ',2009);
    ('SQL para leigos','João Nunes','M',450,'ADDISON',98,'SP',2018);
    ('Receitas Caseiras','Celia Tavares','F',210,'ATLAS',45,'RJ',2008);
    ('Pessoas Efetivas','Eduardo Santos','M',390,'BETA',78,99,'RJ',2018);
    ('Hábitos Saudáveis','Eduardo Santos','M',630,'BETA',150,98,'RJ',2019);
    ('A Casa Marron','Hermes Macedo','M',250,'BUBBA',60,'MG',2016);
    ('Estacio Querido','Geraldo Francisco','M',310,'ENIGMA',100,'ES',2015);
    ('Pra sempre amigas','Leda Silva','F',510,'ENIGMA',78,98,'ES',2011);
    ('Copas Inesqueciveis','Marco Alcantara','M',200,'LARSON',130,98,'ES',2018);
    ('O poder da mente','Clara Mafra','F',120,'CONTINENTAL',56,58,'RS',2017);

/*  QUERYS: */
/*	Cria database LIVRARIA: */
	CREATE DATABASE LIVRARIA;

/*	Cria tabela LIVROS: */
	CREATE TABLE `LIVROS` (
		`LIVRO` varchar(50) DEFAULT NULL,
		`AUTOR` varchar(30) DEFAULT NULL,
		`SEXO` char(1) DEFAULT NULL,
		`PAGINAS` int DEFAULT NULL,
		`EDITORA` varchar(20) DEFAULT NULL,
		`VALOR` float DEFAULT NULL,
		`UF` char(2) DEFAULT NULL,
		`ANO` int DEFAULT NULL
	);

/*	Insere dados para teste: */
	INSERT INTO LIVROS(LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR,UF, ANO)
        VALUES  ('Cavaleiro Real','Ana Claudia','F',465,'ATLAS',49.90,'RJ',2009),
                ('SQL para leigos','João Nunes','M',450,'ADDISON',98,'SP',2018),
	            ('Receitas Caseiras','Celia Tavares','F',210,'ATLAS',45,'RJ',2008),
	            ('Pessoas Efetivas','Eduardo Santos','M',390,'BETA',78.99,'RJ',2018),
	            ('Hábitos Saudáveis','Eduardo Santos','M',630,'BETA',150.98,'RJ',2019),
	            ('A Casa Marron','Hermes Macedo','M',250,'BUBBA',60,'MG',2016),
	            ('Estacio Querido','Geraldo Francisco','M',310,'ENIGMA',100,'ES',2015),
	            ('Pra sempre amigas','Leda Silva','F',510,'ENIGMA',78.98,'ES',2011),
	            ('Copas Inesqueciveis','Marco Alcantara','M',200,'LARSON',130.98,'ES',2018),
	            ('O poder da mente','Clara Mafra','F',120,'CONTINENTAL',56.58,'RS',2017);

/*  Queries para desenvolvedor: */
	
/*  Projeta todos os dados da tabela LIVROS */
	SELECT LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO
        FROM LIVROS;

/*  Projeta nome do editora e nome da editora */
	SELECT LIVRO, EDITORA
        FROM LIVROS;

/*  Projeta nome do livro e sigla do estado da editora por autor do sexo masculino */
	SELECT LIVRO, UF
        FROM LIVROS
    WHERE SEXO = 'M';

/*  Projeta nome do livro e número de páginas por autor do sexo feminino */
	SELECT LIVRO, PAGINAS
        FROM LIVROS
    WHERE SEXO = 'F';

/*  Projeta valores dos livros das editoras de São Paulo */
	SELECT VALOR
        FROM LIVROS
    WHERE UF = 'SP';

/*  Projeta todos os dados dos livros dos autores do sexo masculino publicados em SP ou RJ */
	SELECT LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO
        FROM LIVROS
    WHERE SEXO = 'M'
        AND UF LIKE 'RJ'
            OR UF LIKE 'SP';
