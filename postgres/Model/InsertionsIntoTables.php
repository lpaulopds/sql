<?php declare(strict_types=1);

namespace App\Model;

/**
 * Insert data in PostgreSQL tables.
 */
class InsertionsIntoTables
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
     * Insert multiples Deps into table departamentos
     * @param $data array
     * @return array
     */
    public function InsertIntoTableDeps($data)
    {
        // prepare statement for insert
        $sql = 'INSERT INTO departamentos(departamento, divisao)
                    VALUES (:departamento, :divisao)';
        $stmt = $this->pdo->prepare($sql);

        // array type variable
        $dtList = [];

        // binds values
        foreach ($data as $list)
        {
            $stmt->bindValue(':departamento', $list['departamento']);
            $stmt->bindValue(':divisao', $list['divisao']);
            $stmt->execute();
        }

        // return array
        return $dtList;
    }

    /**
     * Insert multiples Locations into table localização
     * @param $data array
     * @return array
     */
    public function InsertIntoTableLoca($data)
    {
        // prepare statement for insert
        $sql = 'INSERT INTO localizacao(idRegiao, localizacao, pais)
                    VALUES (:idRegiao, :localizacao, :pais)';
        $stmt = $this->pdo->prepare($sql);

        // array type variable
        $dtList = [];
    
        // binds values
        foreach ($data as $list)
        {
            $stmt->bindValue(':idRegiao', $list['idRegiao']);
            $stmt->bindValue(':localizacao', $list['localizacao']);
            $stmt->bindValue(':pais', $list['pais']);
            $stmt->execute();
        }

        // return array
        return $dtList;
    }

    /**
     * Insert multiples funcionários into table funcionarios
     * @param $data array
     * @return array
     */
    public function InsertIntoTablesFunc($data)
    {
        // prepare statement for insert
        $sql = 'INSERT INTO funcionarios(idFuncionario, nome, email, sexo, departamento, admissao, salario, cargo, idRegiao)
                    VALUES (:idFuncionario, :nome, :email, :sexo, :departamento, :admissao, :salario, :cargo, :idRegiao)';
        $stmt = $this->pdo->prepare($sql);

        // array type variable
        $dtList = [];
    
        // binds values
        foreach ($data as $list)
        {
            $stmt->bindValue(':idFuncionario', $list['idFuncionario']);
            $stmt->bindValue(':nome', $list['nome']);
            $stmt->bindValue(':email', $list['email']);
            $stmt->bindValue(':sexo', $list['sexo']);
            $stmt->bindValue(':departamento', $list['departamento']);
            $stmt->bindValue(':admissao', $list['admissao']);
            $stmt->bindValue(':salario', $list['salario']);
            $stmt->bindValue(':cargo', $list['cargo']);
            $stmt->bindValue(':idRegiao', $list['idRegiao']);
            $stmt->execute();
        }

        // return array
        return $dtList;
    }
}
