<?php declare(strict_types=1); // Strategy Insert Employee

namespace App\Model;

use App\Model\Interfaces\IStrategyStore;
use \App\Connect\Connection;

class InsertEmployeeFormStore implements IStrategyStore
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
    public $nome;

    /**
     * @var string
     */
    public $email;

    /**
     * @var string
     */    
    public $sexo;

    /**
     * @var string
     */
    public $departamento;

    /**
     * @var string
     */
    public $admissao;

    /**
     * @var integer
     */
    public $salario;

    /**
     * @var string
     */
    public $cargo;

    /**
     * @var integer
     */
    public $regiao;

    /**
     * @var mixed
     */
    public $data;

    /**
     * @var string
     */
    public $hora;

    /**
     * @var string
     */
    private $tableMaster;

    /**
     * @var array
     */
    private $dataPack;

    /**
     * @param \PDO
     */
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
        $this->sql = "INSERT INTO $this->tableMaster (nome, email, sexo, departamento,admissao,
                                            salario, cargo, idregiao, dataRegistro, horaRegistro)
                                VALUES (:V1, :V2, :V3, :V4, :V5, :V6, :V7, :V8, :V9, :V10)";

        $this->stmt = $this->pdo->prepare($this->sql);

        date_default_timezone_set('America/Sao_Paulo');
        $this->data = date('Y-m-d');
        $this->hora = date('H:m:s');

        $this->stmt->bindValue(':V1', $this->dataPack['nome']);
        $this->stmt->bindValue(':V2', $this->dataPack['email']);
        $this->stmt->bindValue(':V3', $this->dataPack['sexo']);
        $this->stmt->bindValue(':V4', $this->dataPack['departamento']);
        $this->stmt->bindValue(':V5', $this->dataPack['admissao']);
        $this->stmt->bindValue(':V6', $this->dataPack['salario']);
        $this->stmt->bindValue(':V7', $this->dataPack['cargo']);
        $this->stmt->bindValue(':V8', $this->dataPack['regiao']);
        $this->stmt->bindValue(':V9', $this->data);
        $this->stmt->bindValue(':V10', $this->hora);

        $this->stmt->execute() ?? throw new \PDOException("Error Processing Request", 1);
        $this->pdo->commit() ?? $this->pdo->rollBack();
    }
}
