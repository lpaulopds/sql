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
     * @return mixed
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

    private function getLojaTableCreator(): \App\Model\CreateTables
    {
        $this->instanceCreateTables();
        return $this->tablesCreator->createTablesLoja();
    }

    private function getLocadoraTableCreator(): \App\Model\CreateTables
    {
        $this->instanceCreateTables();
        return $this->tablesCreator->createTablesLocadora();
    }

    private function getShowNameTables(): array
    {
        $this->instanceCreateTables();
        return $this->tablesCreator->getTables();
    }

    private function instanceCreateTables(): \App\Model\CreateTables
    {
        $this->tablesCreator = new CreateTables($this->setDBConn());
        return $this->tablesCreator;
    }

    private function setDBConn(): \PDO
    {
        ($this->pdo = Connection::get()->connect()) ??
            throw new \PDOException("Not connected.");
        return $this->pdo;
    }
}
