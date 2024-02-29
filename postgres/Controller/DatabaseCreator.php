<?php declare(strict_types=1);

namespace App\Controller;

use \App\Connect\Connection as Connection;
use \App\Model\CreateDatabase as CreateDatabase;

class DatabaseCreator
{
    /**
     * @var \PDO
     */
    private $pdo;

    /**
     * @var \App\Model\CreateDatabase $databaseCreator
     */
    private $databaseCreator;

    /**
     * @return void
     */
    public function __construct()
    {
        $this->getDatabaseCreator();
        print 'PostgreSQL database connected';
    }

    /**
     * @return \App\Model\CreateDatabase
     */
    private function getDatabaseCreator()
    {
        $this->setDatabaseCreator();
        return $this->databaseCreator->createDB();
    }

    /**
     * @return void
     */
    private function setDatabaseCreator()
    {
        ($this->pdo = Connection::get()->connect()) ??
            throw new \PDOException("Not connected.");

        $this->databaseCreator = new CreateDatabase($this->pdo);
    }
}
