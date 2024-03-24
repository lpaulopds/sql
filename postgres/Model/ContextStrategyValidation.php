<?php declare(strict_types=1); // Context Validation

namespace App\Model;

use App\Model\Interfaces\IStrategySearchEmployee as ISearch;

class ContextStrategyValidation
{
    private $validStrategy;

    public function __construct(ISearch $validStrategy) {
        $this->validStrategy = $validStrategy;
    }

    public function ContextValidationSearch($data): bool
    {
        if ($this->validStrategy === null) {
            throw new \Exception("Error Processing Request", 1);
        }
        return $this->validStrategy->validate($data);
    }
}
