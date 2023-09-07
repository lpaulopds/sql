/*  Modelagem básica */
/*  Informações do cliente:
    NOME - caracter(30)
    CPF - númerico(11)
    EMAIL - caracter(30)
    TELEFONE - caracter(30)
    ENDEREÇO - caracter(100)
    SEXO - caracter(1) */

/*  Processos de modelagem 
    Fase 01 e 02 - Feita pelo admnistrador de dados:
	MODELAGEM CONCEITUAL: Rascunho.
	MODELAGEM LÓGICA: Qualquer programa de modelagem. */

/*  Fase 03 - Feita DBA e/ou ADM de dados:
	MODELAGEM FÍSICA: Scripts de banco. */

/*  Iniciando modelagem de banco de dados
    Criando o banco de dados: */
	CREATE DATABASE PROJETO;

/*  Conectando-se ao banco de dados: */
	USE PROJETO;

/*  Criando a tabela clientes: */
	CREATE TABLE clientes(
		nome VARCHAR(30),
		sexo CHAR(1),
		email VARCHAR(30),
		cpf INT(11),
		telefone VARCHAR(30),
		endereco VARCHAR(100)
	);

/*  Verificando as tabelas do banco de dados: */
	SHOW TABLES;

/*  Descobrindo a estrutura da tabela: */
	DESC clientes;
