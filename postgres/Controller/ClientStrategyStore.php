<?php declare(strict_types=1); // Strategy - Client

namespace App\Controller;

use App\Model\ContextStrategyStore;
use App\Model\DataEntryDepartmentStore;
use App\Model\DataEntryLocalizationStore;
use App\Model\DataEntryEmployeeStore;
use App\Model\DataEntryMachineStore;
use App\Model\DataEntryGenderStore;
use App\Model\DataEntryFilmStore;
use App\Model\DataEntryLocationStore;

use App\Model\SearchEmployee;
use App\Model\InsertEmployeeFormStore;

class ClientStrategyStore
{
    public function insertDataDepartStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new ContextStrategyStore(new DataEntryDepartmentStore($pdo));
        $secure->enterDataDepartment();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataLocalizationStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new ContextStrategyStore(new DataEntryLocalizationStore($pdo));
        $secure->enterDataLocalization();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataEmployeeStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new ContextStrategyStore(new DataEntryEmployeeStore($pdo));
        $secure->enterDataEmployee();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataMachinesStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new ContextStrategyStore(new DataEntryMachineStore($pdo));
        $secure->enterDataMachines();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataGenderStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new ContextStrategyStore(new DataEntryGenderStore($pdo));
        $secure->enterDataGender();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataFilmStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new ContextStrategyStore(new DataEntryFilmStore($pdo));
        $secure->enterDataFilm();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataLocationStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new ContextStrategyStore(new DataEntryLocationStore($pdo));
        $secure->enterDataLocation();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function searchEmployeeStore($pdo)
    {
        $secure = new SearchEmployeeStore();
        $context = new ContextStrategyStore(new SearchEmployee($pdo));
        $secure->getSearchEmployee();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertEmployeeFormStore($pdo)
    {
        $secure = new InsertEmployeeStore();
        $context = new ContextStrategyStore(new InsertEmployeeFormStore($pdo));
        $secure->getInsertEmployee();
        $context->contextAlgorithm($secure->setEntry());
    }
}
