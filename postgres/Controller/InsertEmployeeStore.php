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
     * @var ClientStrategyValid
     */
    private $obValid;

    /**
     * @var array
     */
    private $dataPack;

    /**
     * Método para retornar validação e inserção
     * @return mixed
     */
    public function getInsertEmployee()
    {
        $this->employeeInsertValidation();
        return $this->setInsertEmployee();
    }

    /**
     * Valida os inputs de funcionário antes da inserção
     * @return void
     */
    private function employeeInsertValidation()
    {
        $this->dataPack = $this->setRouter()->requestRouter()->getPostVars();

        $this->obValid = new ClientStrategyValid();
        $this->obValid->nameEmployeeValidation($this->dataPack['nome']);
        $this->obValid->emailEmployeeValidation($this->dataPack['email']);
        $this->obValid->sexoEmployeeValidation($this->dataPack['sexo']);
    }

    /**
     * Sanitiza e insere os dados
     * @return array
     */
    private function setInsertEmployee()
    {
        $this->dataPack = $this->setRouter()->requestRouter()->getPostVars();

        $this->obInsert = $this->setInsertEmployeeForm();

        $this->obInsert->nome = filter_var($this->dataPack['nome'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->email = filter_var($this->dataPack['email'], FILTER_SANITIZE_EMAIL);
        $this->obInsert->sexo = filter_var($this->dataPack['sexo'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->departamento = filter_var($this->dataPack['departamento'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->admissao = filter_var($this->dataPack['admissao'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->salario = filter_var($this->dataPack['salario'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->cargo = filter_var($this->dataPack['cargo'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $this->obInsert->regiao = filter_var($this->dataPack['regiao'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        return $this->dataPack;
    }

    /**
     * Instância da classe de inserção
     * @return InsertEmployeeFormStore
     */
    private function setInsertEmployeeForm()
    {
        $this->insert = new InsertEmployeeFormStore();
        return $this->insert;
    }

    /**
     * Instância da classe de rotas
     * @return Router
     */
    private function setRouter()
    {
        $this->obRouter = new Router();
        return $this->obRouter;
    }

    /**
     * Retorna dados para o Client solicitante
     * @return array
     */
    public function setEntry() {
        return $this->dataPack;
    }
}
