<?php declare(strict_types=1);

namespace App\Controller;

use \App\Connect\Connection as Connection;
use \App\Model\EmployeeInsertionForm;
use \App\Http\Router;

class EmployeeInseFormController
{
    /**
     * @var \PDO
     */
    private $pdo;

    /**
     * @var EmployeeInsertionForm
     */
    private $insert;

    /**
     * @return string
     */
    public function getInsertEmployee() {
        return $this->setInsertEmployee();
    }

    /**
     * @return string
     */
    private function setInsertEmployee()
    {
        $obRouter = new Router();
        $request = $obRouter->requestRouter();
        $arrPostVars = $request->getPostVars();

        $obInsert = $this->setEmployeeInsertionForm();

        $obInsert->nome = $arrPostVars['nome'];
        $obInsert->email = $arrPostVars['email'];
        $obInsert->sexo = $arrPostVars['sexo'];
        $obInsert->departamento = $arrPostVars['departamento'];
        $obInsert->admissao = $arrPostVars['admissao'];
        $obInsert->salario = $arrPostVars['salario'];
        $obInsert->cargo = $arrPostVars['cargo'];
        $obInsert->regiao = $arrPostVars['regiao'];

        $obInsert->getEmployeeInsert();
    }

    /**
     * @return EmployeeInsertionForm
     */
    private function setEmployeeInsertionForm()
    {
        $this->insert = new EmployeeInsertionForm($this->setDBConn());
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
}
