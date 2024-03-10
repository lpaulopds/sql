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

$obRouter = new Router();

$obRouter->addRoute('GET', '/' ,
function() {
    phpinfo();
});

$obRouter->addRoute('GET', '/postgres/',
function() {
    return new Response(200, new InfraBusiness());
});

$obRouter->addRoute('GET', '/postgres-employee-insertion-form/',
function() {
    require 'postgres/view/employee-insert-form.html';
});

$obRouter->addRoute('POST', '/postgres-employee-insertion-form/', 
function()
{
    $obEmployeeInsert = new EmployeeInseFormController();
    return new Response(200, $obEmployeeInsert->getInsertEmployee());
});

$obRequest = $obRouter->requestRouter();
$obRouter->dispatch($obRequest->getHttpMethod(), $obRequest->getUri());


////////////////////
$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
