<?php declare(strict_types=1);

namespace App\Model;

class EmployeeInsertionForm
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
     * @param type $pdo
     */
    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    /**
     * @return string
     */
    public function getEmployeeInsert() {
        return $this->setEmployeeInsert();
    }

    /**
     * @return string
     */
    private function setEmployeeInsert()
    {
        $this->pdo->beginTransaction();
        $this->sql = 'INSERT INTO funcionarios(nome, email, sexo, departamento,
                                        admissao, salario, cargo, idregiao, dataRegistro, horaRegistro)
                            VALUES (:V1, :V2, :V3, :V4, :V5, :V6, :V7, :V8, :V9, :V10)';
        $this->stmt = $this->pdo->prepare($this->sql);

        date_default_timezone_set('America/Sao_Paulo');
        $this->data = date('d/m/Y');
        $this->hora = date('H:i:s');

        $this->stmt->bindValue(':V1', $this->nome);
        $this->stmt->bindValue(':V2', $this->email);
        $this->stmt->bindValue(':V3', $this->sexo);
        $this->stmt->bindValue(':V4', $this->departamento);
        $this->stmt->bindValue(':V5', $this->admissao);
        $this->stmt->bindValue(':V6', $this->salario);
        $this->stmt->bindValue(':V7', $this->cargo);
        $this->stmt->bindValue(':V8', $this->regiao);
        $this->stmt->bindValue(':V9', $this->data);
        $this->stmt->bindValue(':V10', $this->hora);
        
        $this->stmt->execute();
        $this->pdo->commit();
    }
}
