<?php declare(strict_types=1); // Validation Strategy - Search Employee

namespace App\Model\Interfaces;

interface IStrategySearchEmployee {
    public static function validate($data): bool;
}
