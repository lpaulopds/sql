<?php declare(strict_types=1); // Client Validation search Strategy

namespace App\Controller;

use App\Model\ContextStrategyValidation as Context;
use App\Validations\InputsValidation as Validation;

class ClientStrategyValid
{
    public function searchEmployeeValidation($data)
    {
        $context = new Context(new Validation());
        $context->ContextValidationSearch($data);
    }

    public function nameEmployeeValidation($data)
    {
        $context = new Context(new Validation());
        $context->ContextValidationEmployeeName($data);
    }
}
