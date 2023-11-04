<?php declare(strict_types=1);

namespace App\Model;

class InsertionsIntoTables
{
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function InsertIntoTableDeps($data)
    {
        $sql = 'INSERT INTO departamentos(departamento, divisao)
                    VALUES (:departamento, :divisao)';
        $stmt = $this->pdo->prepare($sql);

        $dtList = [];
        foreach ($data as $list)
        {
            $stmt->bindValue(':departamento', $list['departamento']);
            $stmt->bindValue(':divisao', $list['divisao']);
            $stmt->execute();
        }

        return $dtList;
    }

    public function InsertIntoTableLoca($data)
    {
        $sql = 'INSERT INTO localizacao(idRegiao, localizacao, pais)
                    VALUES (:idRegiao, :localizacao, :pais)';
        $stmt = $this->pdo->prepare($sql);

        $dtList = [];
        foreach ($data as $list)
        {
            $stmt->bindValue(':idRegiao', $list['idRegiao']);
            $stmt->bindValue(':localizacao', $list['localizacao']);
            $stmt->bindValue(':pais', $list['pais']);
            $stmt->execute();
        }

        return $dtList;
    }

    public function InsertIntoTablesFunc($data)
    {
        $sql = 'INSERT INTO funcionarios(idFuncionario, nome, email, sexo, departamento, admissao, salario, cargo, idRegiao)
                    VALUES (:idFuncionario, :nome, :email, :sexo, :departamento, :admissao, :salario, :cargo, :idRegiao)';
        $stmt = $this->pdo->prepare($sql);

        $dtList = [];
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

        return $dtList;
    }
}
