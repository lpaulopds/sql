<?php 

$con_string = "host=postgres port=5432 dbname=testedb user=postgres password=postgres";
$bdcon4 = pg_connect($con_string);
// $db = pg_connect("$bdcon4");
if(!$bdcon4)
{
    echo "Error : Unable to open database\n";
    echo pg_last_error($bdcon4);
}
else
{
    echo "Opened database successfully\n";
}
