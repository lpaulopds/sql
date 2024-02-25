<?php declare(strict_types=1);

namespace App\ConnectMySQL;

class ConnectionMySQL
{
    /**
     * @var type
     */
    private static $conn;

    /**
     * @return \PDO
     * @throws \Exception
     */
    public function connect()
    {
        $paramsIni = parse_ini_file('datab.ini');
        ($paramsIni === false) ?
            throw new \Exception("Error reading configuration file.") : $paramsIni;

        $conStr = sprintf("mysql:host=%s;port=%d;user=%s;password=%s",
                $paramsIni['host'],
                // $paramsIni['dbname'],
                $paramsIni['port'],
                $paramsIni['user'],
                $paramsIni['passwd']
        );

        $pdo = new \PDO($conStr);
        $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

        return $pdo;
    }

    /**
     * @return type
     */
    public static function get() 
    {
        (null === static::$conn) ? static::$conn = new static() : '';
        return static::$conn;
    }

    protected function __construct() {}
    
    private function __clone() {}

    // private function __wakeup() {}
}
