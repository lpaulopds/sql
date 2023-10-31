<?php declare(strict_types=1);

namespace App\Model;

/**
 * Create table in PostgreSQL from PHP demo
 */
class CreateDatabase
{
    /**
     * PDO object
     * @var \PDO
     */
    private $pdo;

    /**
     * init the object with a \PDO object
     * @param type $pdo
     */
    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    /**
     * create database 
     */
    public function createDB()
    {
        /**
         * queries PostgreSQL
         *      $ DROP DATABASE loja;
         *      $ CREATE DATABASE loja;
         */
        $sqlQuery = [
            // 'DROP DATABASE loja;',
            'CREATE DATABASE loja;'
            // '\l'
        ];

        // execute each sql statement to create new database
        foreach ($sqlQuery as $sql) {
            $this->pdo->exec($sql);
        }

        return $this;
    }
}
