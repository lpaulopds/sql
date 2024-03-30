<?php declare(strict_types=1); // Context Validation

namespace App\Model;

use App\Model\Interfaces\IStrategyValidations as IValidations;

class ContextStrategyValidation
{
    private $validStrategy;

    public function __construct(IValidations $validStrategy) {
        $this->validStrategy = $validStrategy;
    }

    public function ContextValidationSearch($data): bool
    {
        if ($this->validStrategy === null) {
            throw new \Exception("Error Processing Request", 1);
        }
        return $this->validStrategy->validateSearch($data);
    }

    public function ContextValidationEmployeeName($data): bool
    {
        if ($this->validStrategy === null) {
            throw new \Exception("Error Processing Request", 1);
        }
        return $this->validStrategy->validateEmployeeName($data);
    }

    public function ContextValidationEmployeeEmail($data): bool
    {
        if ($this->validStrategy === null) {
            throw new \Exception("Error Processing Request", 1);
        }
        return $this->validStrategy->validateEmployeeEmail($data);
    }

    public function ContextValidationEmployeeSexo($data): bool
    {
        if ($this->validStrategy === null) {
            throw new \Exception("Error Processing Request", 1);
        }
        return $this->validStrategy->validateEmployeeSexo($data);
    }
}
