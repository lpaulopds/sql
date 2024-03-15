<?php declare(strict_types=1);

// // GPG key routine for github
// // GPG_TTY=$(tty) && export GPG_TTY && eval $(ssh-agent -s)

$time_start = microtime(true);
////////////////////


require 'vendor/autoload.php';

use \App\Http\Router;
use \App\Http\Response;
use \App\Controller\InfraBusiness;
use \App\Controller\EmployeeInseFormController;
use \App\Controller\SearchEmployeeController;

$obRouter = new Router();

$obRouter->addRoute('GET', '/' ,
function() {
    print date('Y/m/d');
    print date('H:m:s');
    phpinfo();
});

$obRouter->addRoute('GET', '/psql/',
function() {
    return new Response(200, new InfraBusiness());
});

$obRouter->addRoute('GET', '/psql-employee-insert-form/',
function() {
    require 'postgres/view/employee-insert-form.html';
});

$obRouter->addRoute('POST', '/psql-employee-insert-form/',
function()
{
    $obEmployeeInsert = new EmployeeInseFormController();
    return new Response(200, $obEmployeeInsert->getInsertEmployee());
});

$obRouter->addRoute('GET', '/psql-search-employee/',
function() {
    require 'postgres/view/search-employee.html';
});

$obRouter->addRoute('GET', "/psql-search-employee/?*",
function()
{
    $obSearch = new SearchEmployeeController();
    return new Response(200, $obSearch->getSearchEmployeeController());
});


$obRequest = $obRouter->requestRouter();
$obRouter->dispatch($obRequest->getHttpMethod(), $obRequest->getUri());


////////////////////
$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
