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
     * @return mixed
     */
    public function __construct()
    {
        $this->getDatabaseCreator();
        print 'PostgreSQL database created and connected';
    }

    private function getDatabaseCreator(): \App\Model\CreateDatabase
    {
        $this->instanceCreateDatabase();
        return $this->databaseCreator->createDB();
    }

    private function instanceCreateDatabase(): \App\Model\CreateDatabase
    {
        $this->databaseCreator = new CreateDatabase($this->setDBConn());
        return $this->databaseCreator;
    }

    private function setDBConn(): \PDO
    {
        ($this->pdo = Connection::get()->connect()) ??
            throw new \PDOException("Not connected.");
        return $this->pdo;
    }
}
