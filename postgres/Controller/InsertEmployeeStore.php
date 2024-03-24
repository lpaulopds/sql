<?php declare(strict_types=1); // Strategy - Helper class

namespace App\Controller;

use App\Model\InsertEmployeeFormStore;
use App\Http\Router;

class InsertEmployeeStore
{
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

        $this->obInsert->nome = filter_var($this->dataPack['nome'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->email = filter_var($this->dataPack['email'], FILTER_SANITIZE_EMAIL);
        $this->obInsert->sexo = filter_var($this->dataPack['sexo'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->departamento = filter_var($this->dataPack['departamento'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->admissao = filter_var($this->dataPack['admissao'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->salario = filter_var($this->dataPack['salario'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->cargo = filter_var($this->dataPack['cargo'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->regiao = filter_var($this->dataPack['regiao'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        // echo '<pre>';
        // print_r($this->dataPack);
        // echo '</pre>';die;
    }

    /**
     * @return InsertEmployeeFormStore
     */
    private function setInsertEmployeeForm()
    {
        $this->insert = new InsertEmployeeFormStore();
        return $this->insert;
    }

    /**
     * Retorna dados para o Client solicitante
     * @return array
     */
    public function setEntry() {
        return $this->dataPack;
    }
}
