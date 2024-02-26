<?php declare(strict_types=1);

require '../vendor/autoload.php';

use \App\ConnectMySQL\ConnectionMySQL as ConnectionMySQL;

($pdo = ConnectionMySQL::get()->connect()) ?
    print "Connected MySQL" . "<br> ----- <br>" :
        throw new \Exception("Not connected.");

/**
 * TEMPO DE EXECUÇÃO
 */
// sleep(3);
$tempo = time() - $_SERVER["REQUEST_TIME_FLOAT"];
printf("%0.16f segs", $tempo/1000000);
print "<br><br><br>";
