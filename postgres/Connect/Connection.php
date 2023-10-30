<?php declare(strict_types=1);

namespace App\Connect;

class Connection
{
    private static $conn;

    public function connect()
    {
        $params = parse_ini_file('datab.ini');
        if ($params === false) {
            throw new \Exception("Error reading configuration file.");
        }
        
        $conStr = sprintf("pgsql:host=%s;port=%d;user=%s;password=%s",
            $params['host'],
            $params['port'],
            $params['user'],
            $params['passwd']);
        
        $pdo = new \PDO($conStr);
        $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

        return $pdo;
    }

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
