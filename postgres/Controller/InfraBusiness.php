<?php declare(strict_types=1);

namespace App\Controller;

use \App\Controller\DatabaseCreator;
use \App\Controller\CreateBusinessTables;
use \App\Controller\InsertInTables;

class InfraBusiness 
{
    /**
     * @var DatabaseCreator
     */
    private $dataCrea;

    /**
     * @var CreateBusinessTables
     */
    private $creaBusiTabl;
    
    /**
     * @var InsertInTables
     */
    private $inseTabl;

    public function __construct()
    {
        // $this->dataCrea = new DatabaseCreator();
        $this->creaBusiTabl = new CreateBusinessTables();
        $this->inseTabl = new InsertInTables();
    }

    public function getDatabaseCreator() {
        return $this->dataCrea;
    }

    public function getCreateBusiTables() {
        return $this->creaBusiTabl;
    }

    public function getInsertInTables() {
        return $this->inseTabl;
    }
}
