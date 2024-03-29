<?php declare(strict_types=1);

namespace App\Connect;

/**
 * Represent the Connection
 */
class Connection
{
    /**
     * Connection
     * @var type 
     */
    private static $conn;

    /**
     * Connect to the database and return an instance of \PDO object
     * @return \PDO
     * @throws \Exception
     */
    public function connect()
    {
        // read parameters in the ini configuration file
        $params = parse_ini_file('datab.ini');
        if ($params === false) {
            throw new \Exception("Error reading configuration file.");
        }
        
        // connect to the postgresql database
        // $conStr = sprintf("pgsql:host=%s;port=%d;user=%s;password=%s",
        $conStr = sprintf("pgsql:host=%s;dbname=%s;port=%d;user=%s;password=%s",
            $params['host'],
            $params['dbname'],
            $params['port'],
            $params['user'],
            $params['passwd']);
        
        $pdo = new \PDO($conStr);
        $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

        return $pdo;
    }

    /**
     * return an instance of the Connection object
     * @return type
     */
    public static function get()
    {
        if (null === static::$conn) {
            static::$conn = new static();
        }

        return static::$conn;
    }
    
    protected function __construct() {}

    private function __clone() {}

    // private function __wakeup() {}
}
