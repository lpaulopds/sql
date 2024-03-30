<?php declare(strict_types=1); // Validation Strategy - Search Employee

namespace App\Model\Interfaces;

interface IStrategyValidations {
    public static function validateSearch($data): bool;
    public static function validateEmployeeName($data): bool;
    public static function validateEmployeeEmail($data): bool;
    public static function validateEmployeeSexo($data): bool;
}
