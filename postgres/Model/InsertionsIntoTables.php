<?php declare(strict_types=1);

namespace App\Model;

class InsertionsIntoTables
{
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function InsertIntoTable($data)
    {
        $sql = 'INSERT INTO departamentos(departamento,divisao) VALUES (:departamento, :divisao)';
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
}
