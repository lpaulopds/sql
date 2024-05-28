<?php declare(strict_types=1);

// // GPG key routine for github
// // GPG_TTY=$(tty) && export GPG_TTY && eval $(ssh-agent -s)

$time_start = microtime(true);
////////////////////


require 'vendor/autoload.php';

use App\Http\Router;
use App\Http\Response;
use App\Controller\InfraBusiness;
use App\Controller\ClientStrategyStore;
use App\Controller\ClientStrategyError;
use App\Controller\EmployeeInsertForm;
use App\BinaryTree\ClientBinaryTree;

$obRouter = new Router();
$obSelect = new ClientStrategyStore();

// // Página home
$obRouter->get('/', function()
{
    print date('Y/m/d') . "<br>";
    print date('H:m:s') . "<br>";

    phpinfo();
});

// // Cria tabelas e faz inserções
$obRouter->get('/environment', function() {
    return new Response(200, new InfraBusiness());
});

// // Retorna formulário para inserção de funcionários
$obRouter->get('/insert', function()
{
    $obEmpForm = new EmployeeInsertForm();
    return new Response(200, $obEmpForm->EmployeeInsertForm());
});

// // Faz a inserção de funcionários
$obRouter->post('/insert', function()
{
    $obInsert = new ClientStrategyStore();
    return new Response(200, $obInsert->insertEmployeeFormStore());
});

// // Retorna tabela com projeção de funcionários
$obRouter->get('/table', function()
{
    $obSelect = new ClientStrategyStore();
    return new Response(200, $obSelect->selectEmployee());
});

$obRouter->get('/binary-tree', function() {
    return new Response(200, new ClientBinaryTree());
});

// // Retorna formulário de busca de funcionário
$obRouter->get('/search', function()
{
    $obSearchForm = new ClientStrategyStore();
    return new Response(200, $obSearchForm->searchForm());
});

// // Retorna resultado da busca de funcionário
// print_r($obRouter->requestRouter()->getQueryParams());
$queryKeyParam = array_keys($obRouter->requestRouter()->getQueryParams());
$queryValueParam = array_values($obRouter->requestRouter()->getQueryParams());
$key = json_encode($queryKeyParam);
$value = json_encode($queryValueParam);
$obRouter->get("/search?$key=$value", function()
{
    $obSearch = new ClientStrategyStore();
    return new Response(200, $obSearch->searchEmployeeStore());
});



// // Retorna e salva log de erro
ClientStrategyError::displayError();

$obRequest = $obRouter->requestRouter();
$obRouter->dispatch($obRequest->getHttpMethod(), $obRequest->getUri());

////////////////////
$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
