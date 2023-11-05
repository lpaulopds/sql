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

//     $database ? print 'Created Database' :
//          print 'Error in query create database';

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
    $tables ? print 'Created Tables<br>' :
        print 'Error in query create table';

    $descTables = $tablesCreator->getTables();
    print_r($descTables);
    print '<br>';
}
catch (\PDOException $e) {
    print $e->getMessage();
}


use \App\Model\InsertionsIntoTables as InsertionsIntoTables;
$insertDemo = new InsertionsIntoTables($pdo);

try
{
    $fileDeps = fopen('postgres/deps.txt', 'r');
    while (!feof($fileDeps)) {
        $resultsDeps[] = explode(",", fgets($fileDeps));
    }    
    fclose($fileDeps);

    foreach ($resultsDeps as $dataDeps)
    {
        $listDeps = $insertDemo->InsertIntoTableDeps([
            [
                'departamento' => $dataDeps[0],
                'divisao' => $dataDeps[1]
            ]
        ]);
        print_r($dataDeps);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}

try
{
    $fileLoca = fopen('postgres/loca.txt', 'r');
    while (!feof($fileLoca)) {
        $resultsLoca[] = explode(",", fgets($fileLoca));
    }
    fclose($fileLoca);

    foreach ($resultsLoca as $dataLoca)
    {
        $listLoca = $insertDemo->InsertIntoTableLoca([
            [
                'idRegiao' => $dataLoca[0],
                'localizacao' => $dataLoca[1],
                'pais' => $dataLoca[2]
            ]
        ]);
        print_r($dataLoca);
        print "<br>";
    }
}
catch (\PDOException $e) {
    echo $e->getMessage();
}

try
{
    $fileFunc = fopen('postgres/func.txt', 'r');
    while (!feof($fileFunc)) {
        $resultsFunc[] = explode(",", fgets($fileFunc));
    }
    fclose($fileFunc);

    foreach ($resultsFunc as $dataFunc)
    {
        $listFunc = $insertDemo->InsertIntoTableFunc([
            [
                'idFuncionario' => $dataFunc[0],
                'nome' => $dataFunc[1],
                'email' => $dataFunc[2],
                'sexo' => $dataFunc[3],
                'departamento' => $dataFunc[4],
                'admissao' => $dataFunc[5],
                'salario' => $dataFunc[6],
                'cargo' => $dataFunc[7],
                'idRegiao' => $dataFunc[8]
            ]
        ]);
        print_r($dataFunc);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}

try
{
    $fileMach = fopen('postgres/mach.txt', 'r');
    while (!feof($fileMach)) {
        $resultsMach[] = explode(",", fgets($fileMach));
    }
    fclose($fileMach);

    foreach ($resultsMach as $dataMach)
    {
        $listFunc = $insertDemo->InsertIntoTableMaqs([
            [
                'maquina' => $dataMach[0],
                'dia' => $dataMach[1],
                'qtd' => $dataMach[2]
            ]
        ]);
        print_r($dataMach);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}

// sleep(3);
$tempo = time() - $_SERVER["REQUEST_TIME_FLOAT"];
printf("%0.16f segs", $tempo/1000000);
