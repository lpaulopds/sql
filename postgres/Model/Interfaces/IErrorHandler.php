<?php declare(strict_types=1); // Error Strategy

namespace App\Model\Interfaces;

interface IErrorHandler {
    public static function handle();
}