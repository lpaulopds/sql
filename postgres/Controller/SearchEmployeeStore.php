<?php declare(strict_types=1); // Strategy - Controller Helper class

namespace App\Controller;

use App\Model\SearchEmployee as SearchEmployee;
use App\Http\Router as Router;

class SearchEmployeeStore
{
    /**
     * @var SearchEmployee
     */
    public $search;

    /**
     * @var SearchEmployee
     */
    private $obSearch;

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
     * Instância da classe de busca de funcionário
     * @return SearchEmployee
     */
    private function setSearchEmployee()
    {
        $this->search = new SearchEmployee();
        return $this->search;
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
     * Validação da busca de funcionário
     * @return void
     */
    private function employeeSearchValidation()
    {
        // Retorna paramentro da URL
        $this->dataPack = $this->setRouter()->requestRouter()->getQueryParams();

        // Valida input do usuário
        $this->obValid = new ClientStrategyValid();
        $this->obValid->searchEmployeeValidation($this->dataPack['search']);
    }

    /**
     * Sanitiza e faz busca de funcionário
     * @return array
     */
    private function setSearchEmployeeStore()
    {
        $this->dataPack = $this->setRouter()->requestRouter()->getQueryParams();

        $this->obSearch = $this->setSearchEmployee();

        if ($this->dataPack)
        {
            filter_var($this->dataPack['search'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            return $this->obSearch->algorithm($this->dataPack);
        }
    }

    /**
     * Retorna validação e busca de funcionário
     * @return array
     */
    public function getSearchEmployee()
    {
        $this->employeeSearchValidation();
        return $this->setSearchEmployeeStore();
    }

    /**
     * Retorna dados para o Client solicitante
     * @return array
     */
    public function setEntry() {
        return $this->dataPack;
    }
}
