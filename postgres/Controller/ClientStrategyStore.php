<?php declare(strict_types=1); // Strategy - Client

namespace App\Controller;

use App\Model\ContextStrategyStore as Context;
use App\Model\DataEntryDepartmentStore as InsertDepart;
use App\Model\DataEntryLocalizationStore as InsertLocalization;
use App\Model\DataEntryEmployeeStore as InsertEmployee;
use App\Model\DataEntryMachineStore as InsertMachine;
use App\Model\DataEntryGenderStore as InsertGender;
use App\Model\DataEntryFilmStore as InsertFilm;
use App\Model\DataEntryLocationStore as InsertLocation;

use App\Model\SearchEmployee as Search;
use App\Model\InsertEmployeeFormStore as InsertEmployeeF;

class ClientStrategyStore
{
    public function insertDataDepartStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertDepart($pdo));
        $secure->enterDataDepartment();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataLocalizationStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertLocalization($pdo));
        $secure->enterDataLocalization();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataEmployeeStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertEmployee($pdo));
        $secure->enterDataEmployee();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataMachinesStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertMachine($pdo));
        $secure->enterDataMachines();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataGenderStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertGender($pdo));
        $secure->enterDataGender();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataFilmStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertFilm($pdo));
        $secure->enterDataFilm();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertDataLocationStore($pdo)
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertLocation($pdo));
        $secure->enterDataLocation();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function searchEmployeeStore($pdo)
    {
        $secure = new SearchEmployeeStore();
        $context = new Context(new Search($pdo));
        $secure->getSearchEmployee();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertEmployeeFormStore($pdo)
    {
        $secure = new InsertEmployeeStore();
        $context = new Context(new InsertEmployeeF($pdo));
        $secure->getInsertEmployee();
        $context->contextAlgorithm($secure->setEntry());
    }
}
