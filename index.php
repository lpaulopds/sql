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

$obRouter = new Router();

$obRouter->addRoute('GET', '/' ,
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
    require 'postgres/view/employee-insert-form.html';
});

$obRouter->addRoute('POST', '/psql-employee-insert-form/',
function()
{
    $obInsert = new ClientStrategyStore();
    return new Response(200, $obInsert->insertEmployeeFormStore());
});

$obRouter->addRoute('GET', '/psql-search-employee/',
function() {
    require 'postgres/view/search-employee.html';
});

$obRouter->addRoute('GET', "/psql-search-employee/?*",
function()
{
    $obSearch = new ClientStrategyStore();
    return new Response(200, $obSearch->searchEmployeeStore());
});

// // Função de tratamento de erro personalizada
// function handleError($errno, $errstr, $errfile, $errline) {
//     echo "Erro: [$errno] $errstr - $errfile:$errline";
//     // print_r($errcontext[0]);
//     // Você pode fazer mais coisas aqui, como registrar o erro em um arquivo de log
// }

// // Define a função de tratamento de erro personalizada
// set_error_handler("handleError");

function handleError($errno, $errstr, $errfile, $errline)
{
    echo "<h1>[$errno] $errstr </h1>";
    echo "<h3>$errfile $errline</h3>";
}
set_error_handler("handleError");


$obRequest = $obRouter->requestRouter();
$obRouter->dispatch($obRequest->getHttpMethod(), $obRequest->getUri());


////////////////////
$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
