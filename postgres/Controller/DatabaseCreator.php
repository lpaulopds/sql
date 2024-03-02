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
        print 'PostgreSQL database created and connected';
    }

    /**
     * @return \App\Model\CreateDatabase
     */
    private function getDatabaseCreator()
    {
        $this->instanceCreateDatabase();
        return $this->databaseCreator->createDB();
    }

    /**
     * @return \App\Model\CreateDatabase
     */
    private function instanceCreateDatabase()
    {
        $this->databaseCreator = new CreateDatabase($this->setDBConn());
        return $this->databaseCreator;
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
