<?php declare(strict_types=1); // Strategy 3

namespace App\Model\Insert;

use App\Model\Interfaces\IStrategyStore;
use \App\Connect\Connection;

class DataEntryEmployeeStore implements IStrategyStore
{
    /**
     * @var string
     */
    private $tableMaster;

    /**
     * @var array
     */
    private $dataPack;

    /**
     * @var \PDO
     */
    private $pdo;

    /**
     * @var string
     */
    private $sql;

    /**
     * @var \PDOStatement
     */
    private $stmt;

    public function __construct()
    {
        $pdo = Connection::get()->connect();
        $this->pdo = $pdo;
    }

    public function algorithm(Array $dataPack)
    {
        $this->dataPack = $dataPack;
        $this->tableMaster = IStrategyStore::TABLEEMPLOYEE;

        $this->pdo->beginTransaction();
        $this->sql = "INSERT INTO $this->tableMaster (nome, email, sexo, departamento, admissao,
                                    salario, cargo, idRegiao, dataRegistro, horaRegistro)
                                VALUES (:V0, :V1, :V2, :V3, :V4, :V5, :V6, :V7, :V8, :V9)";
        $this->stmt = $this->pdo->prepare($this->sql);

        date_default_timezone_set('America/Sao_Paulo');
        $dataReg = date('Y-m-d');
        $horaReg = date('H:m:s');

        $this->stmt->bindValue(':V0', $this->dataPack[0]);
        $this->stmt->bindValue(':V1', $this->dataPack[1]);
        $this->stmt->bindValue(':V2', $this->dataPack[2]);
        $this->stmt->bindValue(':V3', $this->dataPack[3]);
        $this->stmt->bindValue(':V4', $this->dataPack[4]);
        $this->stmt->bindValue(':V5', $this->dataPack[5]);
        $this->stmt->bindValue(':V6', $this->dataPack[6]);
        $this->stmt->bindValue(':V7', $this->dataPack[7]);
        $this->stmt->bindValue(':V8', $dataReg);
        $this->stmt->bindValue(':V9', $horaReg);

        // echo '<pre>';
        // print_r($this->dataPack);
        // echo '</pre>';

        $this->stmt->execute() ?? throw new \PDOException("Error Processing Request", 1);
        $this->pdo->commit() ?? $this->pdo->rollBack();
    }
}
