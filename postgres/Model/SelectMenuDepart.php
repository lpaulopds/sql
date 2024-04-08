<?php declare(strict_types=1); // Strategy Menu Select

namespace App\Model;

use App\Model\Interfaces\IStrategyStore;
use \App\Connect\Connection;

class SelectMenuDepart implements IStrategyStore
{
    /**
     * @var string
     */
    private $tableMasterDepart;

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

    public function algorithm(array $dataPack)
    {
        $this->dataPack = $dataPack;
        $this->tableMasterDepart = IStrategyStore::TABLEDEPART;

        $this->sql = "SELECT d.departamento FROM $this->tableMasterDepart d";

        $this->stmt = $this->pdo->prepare($this->sql);
        $this->stmt->execute() ?? throw new \PDOException("Error Proccessing Request", 1);

        return $this->stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}
