<?php declare(strict_types=1); // Strategy - Validation

namespace App\Validations;

use App\Model\Interfaces\IStrategyValidations as Validation;

class InputsValidation implements Validation
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
        echo '<p style=color:red>Sem resultado</p>';

        return die();
    }

    /**
     * @param mixed
     * @return bool
     */
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

        echo '<p style=color:red>Incorreto</p>';
        return die();
    }

    /**
     * @param mixed
     * @return bool
     */
    public static function validateEmployeeEmail($data): bool
    {
        if (filter_var($data, FILTER_VALIDATE_EMAIL)) {
            return TRUE;
        }
        else {
            echo '<p style=color:red>E-mail incorreto</p>';
            return die();
        }
    }

    public static function validateEmployeeSexo($data): bool
    {
        if ($data) return TRUE;

        echo '<p style=color:red>Selecione o sexo</p>';
        return die();
    }
}
