<?php declare(strict_types=1);

namespace App\Controller;

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
     * @var ClientStrategyStore
     */
    private $insert;

    public function __construct()
    {
        // // Instances for create database and tabless
        // $this->dataCrea = new DatabaseCreator();
        $this->creaBusiTabl = new CreateBusinessTables();

        // // Triggers Strategy store
        $this->insert = new ClientStrategyStore();
        $this->insert->insertDataDepartStore();
        $this->insert->insertDataLocalizationStore();
        $this->insert->insertDataEmployeeStore();
        $this->insert->insertDataMachinesStore();
        $this->insert->insertDataGenderStore();
        $this->insert->insertDataFilmStore();
        $this->insert->insertDataLocationStore();
    }

    public function getDatabaseCreator() {
        return $this->dataCrea;
    }

    public function getCreateBusiTables() {
        return $this->creaBusiTabl;
    }

    public function getInsert() {
        return $this->insert;
    }
}
