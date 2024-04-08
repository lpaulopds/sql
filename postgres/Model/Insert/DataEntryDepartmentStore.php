<?php declare(strict_types=1); // Strategy 1

namespace App\Model\Insert;

use App\Model\Interfaces\IStrategyStore;
use App\Connect\Connection;

class DataEntryDepartmentStore implements IStrategyStore
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
        $this->tableMaster = IStrategyStore::TABLEDEPART;
        
        $this->pdo->beginTransaction();
        $this->sql = "INSERT INTO $this->tableMaster (departamento, divisao)
                                VALUES (:V1, :V2)";

        $this->stmt = $this->pdo->prepare($this->sql);

        $this->stmt->bindValue(':V2', $this->dataPack[1]);
        $this->stmt->bindValue(':V1', $this->dataPack[0]);

        // echo '<pre>';
        // print_r($this->dataPack);
        // echo '</pre>';

        $this->stmt->execute() ?? throw new \PDOException("Error Processing Request", 1);
        $this->pdo->commit() ?? $this->pdo->rollBack();
    }
}
