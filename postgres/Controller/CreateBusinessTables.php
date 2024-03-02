<?php declare(strict_types=1);

namespace App\Controller;

use \App\Connect\Connection as Connection;
use \App\Model\CreateTables as CreateTables;

class CreateBusinessTables
{
    /**
     * @var \PDO
     */
    private $pdo;

    /**
     * @var \App\Model\CreateTables $tablesCreator
     */
    private $tablesCreator;

    /**
     * @return void
     */
    public function __construct()
    {
        $this->getLojaTableCreator();
        $this->getLocadoraTableCreator();

        echo "<pre>";
        print 'Tabelas da loja e locadora criadas<br>';
        print_r($this->getShowNameTables());
        echo "</pre>";
    }

    /**
     * @return \App\Model\CreateTables
     */
    private function getLojaTableCreator()
    {
        $this->instanceCreateTables();
        return $this->tablesCreator->createTablesLoja();
    }

    /**
     * @return \App\Model\CreateTables
     */
    private function getLocadoraTableCreator()
    {
        $this->instanceCreateTables();
        return $this->tablesCreator->createTablesLocadora();
    }

    /**
     * @return array
     */
    private function getShowNameTables()
    {
        $this->instanceCreateTables();
        return $this->tablesCreator->getTables();
    }

    /**
     * @return \App\Model\CreateTables
     */
    private function instanceCreateTables()
    {
        $this->tablesCreator = new CreateTables($this->setDBConn());
        return $this->tablesCreator;
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
