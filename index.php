<?php 

// $con_string = "host=postgres port=5432 user=postgres password=postgres";
// $bdcon = pg_connect($con_string);
// if(!$bdcon)
// {
//     echo "Error : Unable to open database\n";
//     echo pg_last_error($bdcon);
// }
// else {
//     echo "Opened database successfully\n";
// }

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
phpinfo();
die;
require 'postgres/config.php';
try
{
    $dsn = "psql:host=$host;port=$port;";
    $pdo = new PDO($dsn,$user,$password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    if ($pdo) {
        echo "Connected with database.";
    }
}
catch(PDOException $e) {
    die($e->getMessage());
}
// finally {
//     if ($pdo) {
//         $pdo = null;
//     }
// }
