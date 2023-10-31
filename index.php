<?php 

// $con_string = "host=postgres port=5432 user=postgres password=postgres";
// $bdcon = pg_connect($con_string);
// if(!$bdcon)
// {
//     echo "Error : Unable to open database\n";
// }
// else {
//     echo "Opened database successfully\n";
// }
// die;

// $sql =<<<EOF
//     CREATE TABLE COMPANY
//     (ID INT PRIMARY KEY     NOT NULL,
//     NAME           TEXT    NOT NULL,
//     AGE            INT     NOT NULL,
//     ADDRESS        CHAR(50),
//     SALARY         REAL);
// EOF;

// $ret = pg_query($bdcon, $sql);
// if(!$ret) {
//     echo pg_last_error($bdcon);
// } else {
//     echo "Table created successfully\n";
// }
// pg_close($bdcon);

// echo "<pre>";
// print_r($_SERVER);
// echo "</pre>";
// phpinfo();
// die;

// require 'postgres/config.php';
// try
// {
//     $dsn = "pgsql:host=$host;port=$port;";
//     $pdo = new PDO($dsn,$user,$password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
//     if ($pdo) {
//         echo "Connected with database.";
//     }
// }
// catch(PDOException $e) {
//     die($e->getMessage());
// }
// // finally {
// //     if ($pdo) {
// //         $pdo = null;
// //     }
// // }

// $sql =<<<EOF
//     CREATE DATABASE LOJA;
// EOF;

// $ret = pg_connect($pdo, $sql);
// if(!$ret) {
//     echo pg_last_error($pdo);
// } else {
//     echo "Table created successfully\n";
// }
// pg_close($pdo);

require __DIR__ . '/vendor/autoload.php';

use \App\Connect\Connection as Connection;
use \App\Model\CreateDatabase as CreateDatabase;

try 
{
    $pdo = Connection::get()->connect();
    print "Connected";
}
catch (\PDOException $e) {
    print $e->getMessage();
}

try
{
    $databaseCreator = new CreateDatabase($pdo);

    $database = $databaseCreator->createDB();

    foreach ($database as $db) {
        print $db . '<br>';
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}
