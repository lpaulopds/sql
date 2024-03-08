<?php declare(strict_types=1);

// // GPG key routine for github
// // GPG_TTY=$(tty) && export GPG_TTY && eval $(ssh-agent -s)

$time_start = microtime(true);
////////////////////


require 'vendor/autoload.php';

use \App\Http\Router;
use \App\Http\Response;
use \App\Controller\InfraBusiness;

$obRouter = new Router();

$obRouter->addRoute('GET', '/' , function()
{
    echo "<pre>";
    // print_r($_SERVER);
    print_r(getallheaders());
    echo "</pre>";
    // phpinfo();
});

$obRouter->addRoute('GET', '/postgres/' , function() {
    return new Response(200, new InfraBusiness());
});

$obRequest = $obRouter->requestRouter();
$obRouter->dispatch($obRequest->getHttpMethod(), $obRequest->getUri());


////////////////////
$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
