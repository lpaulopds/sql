<?php declare(strict_types=1); // Strategy - helper Class

namespace App\Controller;

use \App\Connect\Connection as Connection;

use \App\Model\DataEntryDepartmentStore;
use \App\Model\DataEntryLocalizationStore;
use \App\Model\DataEntryEmployeeStore;
use \App\Model\DataEntryMachineStore;
use \App\Model\DataEntryGenderStore;
use \App\Model\DataEntryFilmStore;
use \App\Model\DataEntryLocationStore;

class SecureDataStore
{
    /**
     * @var \PDO
     */
    private $hookup;

    private $insert;

    /**
     * @var resource
     */
    private $file;

    /**
     * @var integer
     */
    private $batchSize;

    /**
     * @var string
     */
    private $lines;

    /**
     * @var array
     */
    private $dataPack;

    private function getInsertDepart()
    {
        $this->insert = new DataEntryDepartmentStore($this->setDBConn());
        return $this->insert;
    }

    /**
     * @return array
     */
    public function enterDataDepartment()
    {
        $this->file = fopen('postgres/data-db/departamentos.txt', 'r');
        $this->batchSize = 20;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->dataPack = explode(',', $this->lines);

            filter_var($this->dataPack[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[1], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->getInsertDepart()->algorithm($this->dataPack);
            // echo '<pre>';
            // print_r($this->dataPack);
            // echo '</pre>';
        }
        fclose($this->file);
    }

    private function getInsertLocation()
    {
        $this->insert = new DataEntryLocationStore($this->setDBConn());
        return $this->insert;
    }

    public function enterDataLocalization()
    {
        $this->file = fopen('postgres/data-db/localizacao.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->dataPack = explode(',', $this->lines);

            filter_var($this->dataPack[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[2], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->getInsertLocalization()->algorithm($this->dataPack);
            echo '<pre>';
            print_r($this->dataPack);
            echo '</pre>';
        }
        fclose($this->file);
    }

    private function getInsertEmployee()
    {
        $this->insert = new DataEntryEmployeeStore($this->setDBConn());
        return $this->insert;
    }

    public function enterDataEmployee()
    {
        $this->file = fopen('postgres/data-db/funcionarios-no-id.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->dataPack = explode(',', $this->lines);

            filter_var($this->dataPack[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[2], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[3], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[4], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[5], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[6], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[7], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->getInsertEmployee()->algorithm($this->dataPack);
            echo '<pre>';
            print_r($this->dataPack);
            echo '</pre>';
        }
        fclose($this->file);
    }

    private function getInsertMachines()
    {
        $this->insert = new DataEntryMachineStore($this->setDBConn());
        return $this->insert;
    }

    public function enterDataMachines()
    {
        $this->file = fopen('postgres/data-db/maquinas.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->dataPack = explode(',', $this->lines);

            filter_var($this->dataPack[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[2], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->getInsertMachines()->algorithm($this->dataPack);
            echo '<pre>';
            print_r($this->dataPack);
            echo '</pre>';
        }
        fclose($this->file);
    }

    private function getInsertGender()
    {
        $this->insert = new DataEntryGenderStore($this->setDBConn());
        return $this->insert;
    }

    public function enterDataGender()
    {
        $this->file = fopen('postgres/data-db/genero.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->dataPack = explode(',', $this->lines);

            filter_var($this->dataPack[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[1], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->getInsertGender()->algorithm($this->dataPack);
            echo '<pre>';
            print_r($this->dataPack);
            echo '</pre>';
        }
        fclose($this->file);
    }

    private function getInsertFilm()
    {
        $this->insert = new DataEntryFilmStore($this->setDBConn());
        return $this->insert;
    }

    public function enterDataFilm()
    {
        $this->file = fopen('postgres/data-db/filme.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->dataPack = explode(',', $this->lines);

            filter_var($this->dataPack[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[2], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[3], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->getInsertFilm()->algorithm($this->dataPack);
            echo '<pre>';
            print_r($this->dataPack);
            echo '</pre>';
        }
        fclose($this->file);
    }

    private function getInsertLocalization()
    {
        $this->insert = new DataEntryLocalizationStore($this->setDBConn());
        return $this->insert;
    }

    public function enterDataLocation()
    {
        $this->file = fopen('postgres/data-db/locacao.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->dataPack = explode(',', $this->lines);

            filter_var($this->dataPack[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[2], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[3], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->dataPack[4], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->getInsertLocation()->algorithm($this->dataPack);
            echo '<pre>';
            print_r($this->dataPack);
            echo '</pre>';
        }
        fclose($this->file);
    }

    private function setDBConn(): \PDO
    {
        ($this->hookup = Connection::get()->connect()) ??
            throw new \PDOException("Not connected.");
        return $this->hookup;
    }

    /**
     * Retorna dados para o Client solicitante
     * @return array
     */
    public function setEntry() {
        return $this->dataPack;
    }
}
