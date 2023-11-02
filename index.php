<?php 
// echo "<pre>";
// print_r($_SERVER);
// echo "</pre>";
// phpinfo();
// die;

require __DIR__ . '/vendor/autoload.php';

use \App\Connect\Connection as Connection;
try
{
    $pdo = Connection::get()->connect();
    print "Connected" . "<br>";
}
catch (\PDOException $e) {
    print $e->getMessage();
}


// use \App\Model\CreateDatabase as CreateDatabase;

// try
// {
//     $databaseCreator = new CreateDatabase($pdo);
//     $database = $databaseCreator->createDB();

//     $database ? print 'Created Database' : print 'Error in query create database';

//     foreach ($database as $db) {
//         print $db . '<br>';
//     }
// }
// catch (\PDOException $e) {
//     print $e->getMessage();
// }


use \App\Model\CreateTables as CreateTables;

try
{
    $tablesCreator = new CreateTables($pdo);
    $tables = $tablesCreator->createTables();
    $tables ? print 'Created Tables' : print 'Error in query create table';

    $descTables = $tablesCreator->getTables();
    print '<pre>';
    print_r($descTables);
    print '</pre>';
}
catch (\PDOException $e) {
    print $e->getMessage();
}

use \App\Model\InsertionsIntoTables as InsertionsIntoTables;


$file = fopen('postgres/deps.txt', 'r');

while (!feof($file)) {
    $result[] = explode(",", fgets($file));
}

fclose($file);


foreach ($result as $ln)
{
    print '<pre>';
    print_r($ln);
    print '</pre>';    
}


try
{
    $insertDemo = new InsertionsIntoTables($pdo);
    $list = $insertDemo->InsertIntoTable([
            ['departamento' => 'MSFT', 'divisao' => 'Microsoft Corporation']
    ]);
}
catch (\PDOException $e) {
    echo $e->getMessage();
} 

// sleep(3);
$tempo = time() - $_SERVER["REQUEST_TIME_FLOAT"];
printf("%0.16f segs", $tempo/1000000);
