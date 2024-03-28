<?php declare(strict_types=1); // Strategy - Validation

namespace App\Validations;

use App\Model\Interfaces\IStrategyValidations;

class InputsValidation implements IStrategyValidations
{
    /**
     * @param mixed
     * @return bool
     */
    public static function validateSearch($data): bool
    {

        $pattern = '/[!@#$%^&*()\-_=+{};:,<.>?\[\]\|\/]/';

        $rules= !empty($data) &&
                strlen($data) >= 3 &&
                strlen($data) <= 10 &&
                !is_numeric($data) &&
                !preg_match($pattern, $data) &&
                strstr($data, '');

        if ($rules) return TRUE;

        if (filter_var($data, FILTER_VALIDATE_EMAIL)) return TRUE;
        print '<p style=color:red>Sem resultado</p>';

        return FALSE;
    }

    public static function validateEmployeeName($data): bool
    {
        $pattern = '/[!@#$%^&*()\-_=+{};:,<.>?\[\]\|\/]/';

        $rules= !empty($data) &&
                strlen($data) >= 3 &&
                strlen($data) <= 10 &&
                !is_numeric($data) &&
                !preg_match($pattern, $data) &&
                strstr($data, '');
        
        if ($rules) return TRUE;

        print '<p style=color:red>Incorreto</p>';
        return die;
    }
}
