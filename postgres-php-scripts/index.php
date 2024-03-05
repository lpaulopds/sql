<?php declare(strict_types=1);

$time_start = microtime(true);

require '../vendor/autoload.php';

// use \App\Controller\DatabaseCreator;
// new DatabaseCreator();
// die;

use \App\Controller\CreateBusinessTables;
new CreateBusinessTables();

use \App\Controller\InsertInTables;
new InsertInTables();

$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
