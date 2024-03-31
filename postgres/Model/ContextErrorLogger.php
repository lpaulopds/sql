<?php declare(strict_types=1); // Strategy - Error Context

namespace App\Model;

use App\Model\Interfaces\IErrorHandler;

class ContextErrorLogger
{
    private $errorHandler;

    public function __construct(IErrorHandler $errorHandler) {
        $this->errorHandler = $errorHandler;
    }

    public function logError() {
        $this->errorHandler->handle();
    }
}
