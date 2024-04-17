<?php declare(strict_types=1); // Strategy - Model Search Employee

namespace App\Model;

use App\Model\Interfaces\IStrategyStore;
use \App\Connect\Connection;

class SearchEmployee implements IStrategyStore
{
    /**
     * @var string
     */
    private $tableMasterEmployee;

    /**
     * @var string
     */
    private $tableMasterLocalization;

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
        $this->tableMasterEmployee = IStrategyStore::TABLEEMPLOYEE;
        $this->tableMasterLocalization = IStrategyStore::TABLELOCALIZATION;

        $this->sql = "SELECT f.nome, f.email, f.departamento, f.cargo, l.localizacao
                        FROM $this->tableMasterEmployee f
                            INNER JOIN $this->tableMasterLocalization l
                            ON f.idregiao = l.idregiao
                                WHERE nome ILIKE :searchTerm
                                OR email ILIKE :searchTerm";

        $this->stmt = $this->pdo->prepare($this->sql);
        $this->stmt->bindValue(':searchTerm', $this->dataPack['search']);

        $this->stmt->execute() ?? throw new \PDOException("Error Processing Request", 1);
        return $this->stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}
