<?php declare(strict_types=1);

namespace App\Model;

class SearchEmployee
{
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

    /**
     * @var string
     */
    public $searchTerm;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;        
    }

    public function getSearchEmployee() {
        return $this->setSearchEmployee();
    }

    private function setSearchEmployee()
    {
        $this->sql = 'SELECT f.nome, f.email, f.departamento, f.cargo, l.localizacao
                        FROM funcionarios f
                            INNER JOIN localizacao l
                            ON f.idregiao = l.idregiao
                                WHERE nome ILIKE :searchTerm
                                OR email ILIKE :searchTerm';

        $this->stmt = $this->pdo->prepare($this->sql);

        $this->stmt->bindValue(':searchTerm', $this->searchTerm);
        $this->stmt->execute();

        return $this->stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}
