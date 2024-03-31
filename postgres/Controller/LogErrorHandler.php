<?php declare(strict_types=1); // Strategy - Concrete

namespace App\Controller;

use App\Model\Interfaces\IErrorHandler;

class LogErrorHandler implements IErrorHandler
{
    public static function handle()
    {
        set_error_handler(function ($errno, $errstr, $errfile, $errline)
        {
            echo "<p>[$errno] $errstr </p>";
            echo "<p>$errfile $errline</p>";
            file_put_contents(
                'postgres/Controller/logs/error.log',
                date('Y-m-d H:m:s') . " - $errno - $errstr - $errfile - $errline \n",
                FILE_APPEND
            );
        });
    }
}
