<?php declare(strict_types=1); // Strategy 4

namespace App\Model;

use App\Model\Interfaces\IStrategyStore;

class DataEntryMachineStore implements IStrategyStore
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

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function algorithm(Array $dataPack)
    {
        $this->dataPack = $dataPack;
        $this->tableMaster = IStrategyStore::TABLEMACHINES;

        $this->pdo->beginTransaction();
        $this->sql = "INSERT INTO $this->tableMaster (maquina, dia, qtd)
                            VALUES (:V1,:V2,:V3)";

        $this->stmt = $this->pdo->prepare($this->sql);

        $this->stmt->bindValue(':V1', $this->dataPack[0]);
        $this->stmt->bindValue(':V2', $this->dataPack[1]);
        $this->stmt->bindValue(':V3', $this->dataPack[2]);

        // echo '<pre>';
        // print_r($this->dataPack);
        // echo '</pre>';

        $this->stmt->execute() ?? throw new \PDOException("Error Processing Request", 1);
        $this->pdo->commit() ?? $this->pdo->rollBack();
    }
}
