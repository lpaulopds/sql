<?php declare(strict_types=1); // Strategy - Validation

namespace App\Validations;

use App\Model\Interfaces\IStrategySearchEmployee;

class ValidationInputSearch implements IStrategySearchEmployee
{
    /**
     * @param mixed
     * @return bool
     */
    public static function validate($data): bool
    {
        $pattern = '/[0-9]+/';

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
}
