<?php declare(strict_types=1);

namespace App\Model;

class CreateTables
{
    /**
     * PDO object
     * @var \PDO
     */
    private $pdo;

    /**
     * init the object with a \PDO object
     * @param type $pdo
     */
    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    /**
     * create tables
     * @return $this
     */
    public function createTables()
    {
        // array with queries
        $sqlList = [
            'DROP TABLE departamentos;',
                'CREATE TABLE departamentos
                (
                    departamento varchar(100),
                    divisao varchar(100),
                    primary key (departamento)
                );',
            'DROP TABLE localizacao;',
                'CREATE TABLE localizacao
                (
                    idRegiao int,
                    localizacao varchar(20),
                    pais varchar(20),
                    primary key (idRegiao)
                );',
            'DROP TABLE funcionarios;',
                'CREATE TABLE funcionarios 
                (
                    idFuncionario integer,
                    nome varchar(100),
                    email varchar(200),
                    sexo varchar(10),
                    departamento varchar(100),
                    admissao date,
                    salario integer,
                    cargo varchar(100),
                    idRegiao int,
                    primary key (idFuncionario)
                );',
            'DROP TABLE maquinas;',
                'CREATE TABLE maquinas
                (
                    maquina VARCHAR(10),
                    dia INT,
                    qtd NUMERIC(10,2)
                );'
        ];

        // execute each sql statement to create new tables
        foreach ($sqlList as $sql) {
            $this->pdo->exec($sql);
        }

        return $this;
    }

    public function createTablesLocadora()
    {
        // array with queries
        $sqlList = [
            'CREATE TABLE GENERO
            (
                IDGENERO INT PRIMARY KEY,
                NOME VARCHAR(30)
            );',
            'CREATE TABLE FILME
            (
                IDFILME INT PRIMARY KEY,
                NOME VARCHAR(50),
                ANO INT,
                ID_GENERO INT,
                FOREIGN KEY(ID_GENERO)
                REFERENCES GENERO(IDGENERO)
            );',
            'CREATE TABLE LOCACAO
            (
                IDLOCACAO INT PRIMARY KEY,
                DATA DATE,
                MIDIA INT,
                DIAS INT,
                ID_FILME INT,
                FOREIGN KEY(ID_FILME)
                REFERENCES FILME(IDFILME)
            
            );'
        ];

        // execute each sql statement to create new tables
        foreach ($sqlList as $sql) {
            $this->pdo->exec($sql);
        }

        return $this;
    }

    /**
     * return tables in database
     * @return array
     */
    public function getTables()
    {
        // prepare statement
        $stmt = $this->pdo->query("SELECT table_name
                                        FROM information_schema.tables
                                        WHERE table_schema= 'public'
                                            AND table_type= 'BASE TABLE'
                                        ORDER BY table_name
        ");

        // array type variable
        $tableList = [];

        // while in tables names
        while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
            $tableList[] = $row['table_name'];            
        }

        // return array
        return $tableList;
    }
}
