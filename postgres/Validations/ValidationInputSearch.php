<?php declare(strict_types=1);

namespace App\Validations;

class ValidationInputSearch
{
    public static function validInputSearch($str)
    {
        $rules= !empty($str) &&
                strlen($str) >= 3 &&
                strlen($str) <= 10 &&
                !is_numeric($str) &&
                strstr($str, '');
        if ($rules)
        {
            return TRUE;
            exit;
        }
        if (filter_var($str, FILTER_VALIDATE_EMAIL)) 
        {
            return TRUE;
            exit;
        }
        else
        {
            echo '<h1>False</h1>';
            die;
        }


    }
}
