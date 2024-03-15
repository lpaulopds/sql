<?php declare(strict_types=1);

namespace App\Controller;

class InfraBusiness 
{
    /**
     * @var \PDO;
     */
    private $pdo;
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

    /**
     * @var ClientStrategyStore
     */
    private $insert;

    public function __construct()
    {
        // $this->dataCrea = new DatabaseCreator();
        $this->creaBusiTabl = new CreateBusinessTables();
        // $this->inseTabl = new InsertInTables();

        // Triggers Strategy store
        $this->insert = new ClientStrategyStore();
        $this->insert->insertDataDepartStore($this->pdo);
        $this->insert->insertDataLocalizationStore($this->pdo);
        $this->insert->insertDataEmployeeStore($this->pdo);
        $this->insert->insertDataMachinesStore($this->pdo);
        $this->insert->insertDataGenderStore($this->pdo);
        $this->insert->insertDataFilmStore($this->pdo);
        $this->insert->insertDataLocationStore($this->pdo);
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

    public function getInsert() {
        return $this->insert;
    }
}
