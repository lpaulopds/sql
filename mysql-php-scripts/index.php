<?php declare(strict_types=1);

$time_start = microtime(true);

require '../vendor/autoload.php';

use \App\ConnectMySQL\ConnectionMySQL as ConnectionMySQL;

($pdo = ConnectionMySQL::get()->connect()) ?
    print "Connected MySQL" . "<br> ----- <br>" :
        throw new \Exception("Not connected.");

$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
