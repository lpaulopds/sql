<?php declare(strict_types=1); // Strategy - Helper class

namespace App\Controller;

use \App\Connect\Connection as Connection;
use \App\Model\InsertEmployeeFormStore;
use \App\Http\Router;

class InsertEmployeeStore
{
    /**
     * @var \PDO
     */
    private $pdo;

    /**
     * @var InsertEmployeeFormStore
     */
    private $insert;

    /**
     * @var InsertEmployeeFormStore
     */
    private $obInsert;

    /**
     * @var Router
     */
    private $obRouter;

    /**
     * @var array
     */
    private $dataPack;

    /**
     * @return string
     */
    public function getInsertEmployee() {
        return $this->setInsertEmployee();
    }

    private function setInsertEmployee()
    {
        $this->obRouter = new Router();
        $this->dataPack = $this->obRouter->requestRouter()->getPostVars();

        $this->obInsert = $this->setInsertEmployeeForm();

        $this->obInsert->nome = $this->dataPack['nome'];
        $this->obInsert->email = $this->dataPack['email'];
        $this->obInsert->sexo = $this->dataPack['sexo'];
        $this->obInsert->departamento = $this->dataPack['departamento'];
        $this->obInsert->admissao = $this->dataPack['admissao'];
        $this->obInsert->salario = $this->dataPack['salario'];
        $this->obInsert->cargo = $this->dataPack['cargo'];
        $this->obInsert->regiao = $this->dataPack['regiao'];

        $this->obInsert->algorithm($this->dataPack);

        // echo '<pre>';
        // print_r($this->dataPack);
        // echo '</pre>';die;
    }

    /**
     * @return InsertEmployeeFormStore
     */
    private function setInsertEmployeeForm()
    {
        $this->insert = new InsertEmployeeFormStore($this->setDBConn());
        return $this->insert;
    }

    /**
     * @return \PDO
     */
    private function setDBConn()
    {
        ($this->pdo = Connection::get()->connect()) ??
            throw new \PDOException("Not connected.");
        return $this->pdo;
    }

    /**
     * Retorna dados para o Client solicitante
     * @return array
     */
    public function setEntry() {
        return $this->dataPack;
    }
}
