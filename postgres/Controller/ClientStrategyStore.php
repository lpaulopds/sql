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
    public function insertDataDepartStore()
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertDepart());
        foreach ($secure->enterDataDepartment() as $value)
        {
            $value = explode(",", $value);
            $context->contextAlgorithm($value);
            echo '<pre>';
            print_r($value);
            echo '</pre>';
        }
    }

    public function insertDataLocalizationStore()
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertLocalization());
        foreach ($secure->enterDataLocalization() as $value)
        {
            $value = explode(",", $value);
            $context->contextAlgorithm($value);
            echo '<pre>';
            print_r($value);
            echo '</pre>';
        }
    }

    public function insertDataEmployeeStore()
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertEmployee());
        foreach ($secure->enterDataEmployee() as $value)
        {
            $value = explode(",", $value);
            $context->contextAlgorithm($value);
            echo '<pre>';
            print_r($value);
            echo '</pre>';
        }
    }

    public function insertDataMachinesStore()
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertMachine());
        foreach ($secure->enterDataMachines() as $value)
        {
            $value = explode(",", $value);
            $context->contextAlgorithm($value);
            echo '<pre>';
            print_r($value);
            echo '</pre>';
        }
    }

    public function insertDataGenderStore()
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertGender());
        foreach ($secure->enterDataGender() as $value)
        {
            $value = explode(",", $value);
            $context->contextAlgorithm($value);
            echo '<pre>';
            print_r($value);
            echo '</pre>';
        }
    }

    public function insertDataFilmStore()
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertFilm());
        foreach ($secure->enterDataFilm() as $value)
        {
            $value = explode(",", $value);
            $context->contextAlgorithm($value);
            echo '<pre>';
            print_r($value);
            echo '</pre>';
        }
    }

    public function insertDataLocationStore()
    {
        $secure = new SecureDataStore();
        $context = new Context(new InsertLocation());
        foreach ($secure->enterDataLocation() as $value)
        {
            $value = explode(",", $value);
            $context->contextAlgorithm($value);
            echo '<pre>';
            print_r($value);
            echo '</pre>';
        }
    }

    public function searchEmployeeStore()
    {
        $secure = new SearchEmployeeStore();
        $context = new Context(new Search());
        $secure->getSearchEmployee();
        $context->contextAlgorithm($secure->setEntry());
    }

    public function insertEmployeeFormStore()
    {
        $secure = new InsertEmployeeStore();
        $context = new Context(new InsertEmployeeF());
        $secure->getInsertEmployee();
        $context->contextAlgorithm($secure->setEntry());
    }
}
