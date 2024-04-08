<?php declare(strict_types=1);

// // GPG key routine for github
// // GPG_TTY=$(tty) && export GPG_TTY && eval $(ssh-agent -s)

$time_start = microtime(true);
////////////////////


require 'vendor/autoload.php';

use App\Controller\ClientStrategyStore;
use App\Http\Router;
use App\Http\Response;
use App\Controller\InfraBusiness;
use App\Controller\ClientStrategyError;
use App\Controller\EmployeeInsertForm;

$obRouter = new Router();
$obSelect = new ClientStrategyStore();


$obRouter->addRoute('GET', '/',
function()
{
    print date('Y/m/d') . "<br>";
    print date('H:m:s') . "<br>";

    phpinfo();
});

$obRouter->addRoute('GET', '/psql/',
function() {
    return new Response(200, new InfraBusiness());
});

$obRouter->addRoute('GET', '/psql-employee-insert-form/',
function() {
    return new Response(200, EmployeeInsertForm::EmployeeInsertForm());
});

$obRouter->addRoute('POST', '/psql-employee-insert-form/',
function()
{
    $obInsert = new ClientStrategyStore();
    return new Response(200, $obInsert->insertEmployeeFormStore());
});

$obRouter->addRoute('GET', '/psql-search-employee/',
function() {
    require 'postgres/resources/view/search-employee.html';
});

$obRouter->addRoute('GET', "/psql-search-employee/?*",
function()
{
    $obSearch = new ClientStrategyStore();
    return new Response(200, $obSearch->searchEmployeeStore());
});


// // Mostra e salva log de erro
ClientStrategyError::displayError();

$obRequest = $obRouter->requestRouter();
$obRouter->dispatch($obRequest->getHttpMethod(), $obRequest->getUri());


////////////////////
$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
