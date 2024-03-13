<?php declare(strict_types=1);

namespace App\Controller;

use \App\Connect\Connection as Connection;
use \App\Model\SearchEmployee;
use \App\Http\Router;

class SearchEmployeeController
{
    /**
     * @var \PDO
     */
    private $pdo;   

    /**
     * @var SearchEmployee
     */
    public $search;

    public function getSearchEmployeeController() {
        return $this->setSearchEmployeeController();
    }

    private function setSearchEmployeeController()
    {
        $obRouter = new Router();
        $request = $obRouter->requestRouter();
        $arrQueryParam = $request->getQueryParams();
        $obSearch = $this->setSearchEmployee();

        if ($arrQueryParam)
        {
            $obSearch->searchTerm = $arrQueryParam['search'];
            // $obSearch->getSearchEmployee();
            echo '<pre>';
            print_r($obSearch->getSearchEmployee());
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
}
