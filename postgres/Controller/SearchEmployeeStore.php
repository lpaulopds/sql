<?php declare(strict_types=1); // Strategy - Helper class

namespace App\Controller;

use \App\Validations\ValidationInputSearch as Valid;

use \App\Connect\Connection as Connection;
use \App\Model\SearchEmployee;
use \App\Http\Router;

class SearchEmployeeStore
{
    /**
     * @var \PDO
     */
    private $pdo;   

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
            Valid::validInputSearch($this->dataPack['search']);
            
            echo '<pre>';
            print_r($this->obSearch->algorithm($this->dataPack));
            echo '</pre>';
        }
    }

    /**
     * @return SearchEmployee
     */
    private function setSearchEmployee()
    {
        $this->search = new SearchEmployee($this->setDBConn());
        return $this->search;
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
