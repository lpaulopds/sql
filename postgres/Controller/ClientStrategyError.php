<?php declare(strict_types=1); // Strategy - Error client

namespace App\Controller;

use App\Model\ContextErrorLogger;

class ClientStrategyError
{
    public static function displayError()
    {
        $errorLogger = new ContextErrorLogger(new LogErrorHandler);
        $errorLogger->logError();
    }
}
