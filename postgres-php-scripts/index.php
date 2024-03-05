<?php declare(strict_types=1);

$time_start = microtime(true);

require '../vendor/autoload.php';

// use \App\Controller\DatabaseCreator;
// new DatabaseCreator();
// die;
use \App\Controller\CreateBusinessTables;
use \App\Controller\InsertInTables;

// http_response_code(404);

if (
    $_SERVER['REQUEST_METHOD'] === 'GET' &&
    $_SERVER['REQUEST_URI'] === '/postgres-php-scripts/index.php' &&
    $_SERVER['REQUEST_SCHEME'] === 'http' )
{
    new CreateBusinessTables();
    new InsertInTables();
}
else {
    die('Not found');
}


// echo '<pre>';
// print_r(array_keys(getallheaders()));
// echo '</pre>';

// $keyReqHostHeader = array_keys(getallheaders());
// print $keyReqHostHeader[0];

// $valReqHostHeader = array_values(getallheaders());
// print $valReqHostHeader[0];

// header("Accept: text/plan");
// header("Content-Type: text/plan");

$allRequestHeaders = getallheaders();
foreach ($allRequestHeaders as $header => $values)
{
    print "$header: $values <br>";
}


echo '<pre>';
print_r(getallheaders());
echo '</pre>';

// header();

// http_response_code(404);
// print_r($_SERVER['REQUEST_SCHEME']);
// print $_SERVER['REDIRECT_URL'];

$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
