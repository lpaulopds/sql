<?php declare(strict_types=1); // Strategy - Model Employee Select

namespace App\Model;

use App\Model\Interfaces\IStrategyStore;
use \App\Connect\Connection;

class EmployeeSelect implements IStrategyStore
{
    /**
     * @var string
     */
    private $tableMasterEmployee;

    /**
     * @var string
     */
    private $tableMasterLocalizacao;

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
        $this->tableMasterEmployee = IStrategyStore::TABLEEMPLOYEE;
        $this->tableMasterLocalizacao = IStrategyStore::TABLELOCALIZATION;

        $this->sql = "SELECT f.nome, f.email, f.departamento, f.cargo, l.localizacao
                        FROM $this->tableMasterEmployee f
                            INNER JOIN $this->tableMasterLocalizacao l
                                ON f.idregiao = l.idregiao LIMIT 10";

        $this->stmt = $this->pdo->prepare($this->sql);
        $this->stmt->execute() ?? throw new \PDOException("Error Proccessing Request", 1);

        return $this->stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}
