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
     */
    public function createTables()
    {
        $sqlList = [
            'DROP TABLE departamentos',
            'CREATE TABLE departamentos
            (
                departamento varchar(100),
                divisao varchar(100),
                primary key (departamento)
            );',
            'DROP TABLE localizacao',
            'CREATE TABLE localizacao
            (
                idRegiao int,
                localizacao varchar(20),
                pais varchar(20),
                primary key (idRegiao)
            );',
            'DROP TABLE funcionarios',
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
     */
    public function getTables()
    {
        $stmt = $this->pdo->query("SELECT table_name
                                        FROM information_schema.tables
                                        WHERE table_schema= 'public'
                                            AND table_type= 'BASE TABLE'
                                        ORDER BY table_name
        ");

        $tableList = [];
        while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
            $tableList[] = $row['table_name'];            
        }

        return $tableList;
    }
}
