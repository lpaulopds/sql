<?php declare(strict_types=1);

namespace App\Model;

/**
 * Create database in PostgreSQL from PHP demo
 */
class CreateDatabase
{
    /**
     * PDO object
     * @var \PDO
     */
    private $pdo;

    /**
     * Init the object with a \PDO object
     * @param type $pdo
     */
    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    /**
     * Create database 
     * @return $this
     */
    public function createDB()
    {
        /**
         * prepare query
         */
        $sqlQuery = [
            'DROP DATABASE loja;',
            'CREATE DATABASE loja;'
        ];

        // execute each sql statement to create new database
        foreach ($sqlQuery as $sql) {
            $this->pdo->exec($sql);
        }

        return $this;
    }
}
