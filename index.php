<?php declare(strict_types=1);

// // GPG key routine for github
// // GPG_TTY=$(tty) && export GPG_TTY && eval $(ssh-agent -s)

require 'vendor/autoload.php';

use \App\Http\Router;

$obRouter = new Router();

// print_r($obRouter);die;

$obRouter->addRoute('GET', '/' , function()
{
    echo "<pre>";
    print_r($_SERVER);
    echo "</pre>";
    phpinfo();
});

$obRouter->addRoute('GET', '/postgres/' , function() {
    require 'postgres-php-scripts/index.php';
});

$method = $_SERVER['REQUEST_METHOD'];
$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

$obRouter->dispatch($method, $path);
