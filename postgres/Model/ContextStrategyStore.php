<?php declare(strict_types=1); // Context Strategy Store

namespace App\Model;

use \App\Model\Interfaces\IStrategyStore;

class ContextStrategyStore
{
    /**
     * Referência ao objeto
     * @var IStrategyStore
     */
    private $strategy;

    /**
     * Recebe os dados estratégia
     * @var array
     */
    private $dataPack;

    public function __construct(IStrategyStore $strategy) {
        $this->strategy = $strategy;
    }

    public function contextAlgorithm(Array $dataPack)
    {
        $this->dataPack = $dataPack;
        $this->strategy->algorithm($this->dataPack);
    }
}
