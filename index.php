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
    $tables ? print 'Created Tables<br>' : print 'Error in query create table';

    $descTables = $tablesCreator->getTables();
    // print '<pre>';
    print_r($descTables);
    print '<br>';
}
catch (\PDOException $e) {
    print $e->getMessage();
}


use \App\Model\InsertionsIntoTables as InsertionsIntoTables;
try
{
    $file = fopen('postgres/deps.txt', 'r');
    while (!feof($file)) {
        $results[] = explode(",", fgets($file));
    }    
    fclose($file);

    $insertDemo = new InsertionsIntoTables($pdo);
    foreach ($results as $result)
    {
        $list = $insertDemo->InsertIntoTable([
            ['departamento' => $result[0], 'divisao' => $result[1]]
        ]);
        print_r($result);
        print "<br>";
    }
}
catch (\PDOException $e) {
    echo $e->getMessage();
} 


// sleep(3);
$tempo = time() - $_SERVER["REQUEST_TIME_FLOAT"];
printf("%0.16f segs", $tempo/1000000);
