<?php declare(strict_types=1); // Strategy - Helper class

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
     * @var array
     */
    private $dataPack;

    public function getSearchEmployee() {
        return $this->setSearchEmployeeStore();
    }

    private function setSearchEmployeeStore()
    {
        $this->obRouter = new Router();
        $this->dataPack = $this->obRouter->requestRouter()->getQueryParams();
        
        $this->obSearch = $this->setSearchEmployee();

        if ($this->dataPack)
        {
            $obClientValid = new ClientStrategyValid();
            $obClientValid->searchEmployeeValidation(htmlspecialchars($this->dataPack['search']));
            return $this->obSearch->algorithm($this->dataPack);
        }
    }

    /**
     * @return SearchEmployee
     */
    private function setSearchEmployee()
    {
        $this->search = new SearchEmployee();
        return $this->search;
    }

    /**
     * Retorna dados para o Client solicitante
     * @return array
     */
    public function setEntry() {
        return $this->dataPack;
    }
}
