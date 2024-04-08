<?php declare(strict_types=1);

namespace App\Controller;

use App\Controller\ClientStrategyStore;

class EmployeeInsertForm
{
    public static function EmployeeInsertForm()
    {   
        $obMenuSelect = new ClientStrategyStore();
        require 'postgres/resources/view/employee-insert-form.php';
    }
}
