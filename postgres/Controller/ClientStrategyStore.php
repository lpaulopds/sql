<?php declare(strict_types=1); // Strategy - Client Store

namespace App\Controller;

use App\Model\ContextStrategyStore as Context;
use App\Model\EmployeeSelect as EmployeeSelect;
use App\Model\Insert\DataEntryDepartmentStore as InsertDepart;
use App\Model\Insert\DataEntryLocalizationStore as InsertLocalization;
use App\Model\Insert\DataEntryEmployeeStore as InsertEmployee;
use App\Model\Insert\DataEntryMachineStore as InsertMachine;
use App\Model\Insert\DataEntryGenderStore as InsertGender;
use App\Model\Insert\DataEntryFilmStore as InsertFilm;
use App\Model\Insert\DataEntryLocationStore as InsertLocation;
use App\Model\SearchEmployee as Search;
use App\Model\InsertEmployeeFormStore as InsertEmployeeF;

class ClientStrategyStore
{
    /**
     * @var object
     */
    private $secure;

    /**
     * @var object
     */
    private $context;

    /**
     * @var string
     */
    private $departaments;

    /**
     * @var string
     */
    private $localization;

    /**
     * @var string
     */
    private $employee;

    /**
     * @var string
     */
    private $machine;

    /**
     * @var string
     */
    private $gender;

    /**
     * @var string
     */
    private $film;

    /**
     * @var string
     */
    private $location;

    /**
     * @var SelectEmployee
     */
    private $selectEmployee;

    public function insertDataDepartStore()
    { 
        $this->secure = new SecureDataStore();
        $this->context = new Context(new InsertDepart);
        foreach ($this->secure->enterDataDepartment() as $this->departaments)
        {
            $this->departaments = explode(",", $this->departaments);
            $this->context->contextAlgorithm($this->departaments);
            echo '<pre>';
                print_r($this->departaments);
            echo '</pre>';
        }
    }

    public function insertDataLocalizationStore()
    {
        $this->secure = new SecureDataStore();
        $this->context = new Context(new InsertLocalization());
        foreach ($this->secure->enterDataLocalization() as $this->localization)
        {
            $this->localization = explode(",", $this->localization);
            $this->context->contextAlgorithm($this->localization);
            echo '<pre>';
                print_r($this->localization);
            echo '</pre>';
        }
    }

    public function insertDataEmployeeStore()
    {
        $this->secure = new SecureDataStore();
        $this->context = new Context(new InsertEmployee());
        foreach ($this->secure->enterDataEmployee() as $this->employee)
        {
            $this->employee = explode(",", $this->employee);
            $this->context->contextAlgorithm($this->employee);
            echo '<pre>';
                print_r($this->employee);
            echo '</pre>';
        }
    }

    public function insertDataMachinesStore()
    {
        $this->secure = new SecureDataStore();
        $this->context = new Context(new InsertMachine());
        foreach ($this->secure->enterDataMachines() as $this->machine)
        {
            $this->machine = explode(",", $this->machine);
            $this->context->contextAlgorithm($this->machine);
            echo '<pre>';
                print_r($this->machine);
            echo '</pre>';
        }
    }

    public function insertDataGenderStore()
    {
        $this->secure = new SecureDataStore();
        $this->context = new Context(new InsertGender());
        foreach ($this->secure->enterDataGender() as $this->gender)
        {
            $this->gender = explode(",", $this->gender);
            $this->context->contextAlgorithm($this->gender);
            echo '<pre>';
                print_r($this->gender);
            echo '</pre>';
        }
    }

    public function insertDataFilmStore()
    {
        $this->secure = new SecureDataStore();
        $this->context = new Context(new InsertFilm());
        foreach ($this->secure->enterDataFilm() as $this->film)
        {
            $this->film = explode(",", $this->film);
            $this->context->contextAlgorithm($this->film);
            echo '<pre>';
                print_r($this->film);
            echo '</pre>';
        }
    }

    public function insertDataLocationStore()
    {
        $this->secure = new SecureDataStore();
        $this->context = new Context(new InsertLocation());
        foreach ($this->secure->enterDataLocation() as $this->location)
        {
            $this->location = explode(",", $this->location);
            $this->context->contextAlgorithm($this->location);
            echo '<pre>';
                print_r($this->location);
            echo '</pre>';
        }
    }

    /**
     * Retorna formulário de busca
     */
    public function searchForm()
    {
        $obSearchForm = new EmployeeSearchForm();
        $obSearchForm->setEmployeeSearchForm();
    }

    /**
     * Retorna resultado da busca
     */
    public function searchEmployeeStore()
    {
        $this->secure = new SearchEmployeeStore();
        $this->context = new Context(new Search());
        echo '<pre>';
            print_r($this->secure->getSearchEmployee());
        echo '</pre>';
        $this->context->contextAlgorithm($this->secure->setEntry());
    }

    public function insertEmployeeFormStore()
    {
        $this->secure = new InsertEmployeeStore();
        $this->context = new Context(new InsertEmployeeF());
        echo '<pre>';
            print_r($this->secure->getInsertEmployee());
        echo '</pre>';
        $this->context->contextAlgorithm($this->secure->setEntry());
    }

    public function selectEmployee()
    {
        $this->selectEmployee = new SelectEmployee();
        $this->context = new Context(new EmployeeSelect());
        $this->selectEmployee->getSelect();
        $this->context->contextAlgorithm(array(0));
    }
}
