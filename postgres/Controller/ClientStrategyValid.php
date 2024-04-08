<?php declare(strict_types=1); // Client Validation search Strategy

namespace App\Controller;

use App\Model\ContextStrategyValidation as Context;
use App\Validations\InputsValidation as Validation;

class ClientStrategyValid
{
    /**
     * @var Context
     */
    private $context;

    public function searchEmployeeValidation($data)
    {
        $this->context = new Context(new Validation());
        $this->context->ContextValidationSearch($data);
    }

    public function nameEmployeeValidation($data)
    {
        $this->context = new Context(new Validation());
        $this->context->ContextValidationEmployeeName($data);
    }

    public function emailEmployeeValidation($data)
    {
        $this->context = new Context(new Validation());
        $this->context->ContextValidationEmployeeEmail($data);
    }

    public function sexoEmployeeValidation($data)
    {
        $this->context = new Context(new Validation());
        $this->context->ContextValidationEmployeeSexo($data);
    }
}
