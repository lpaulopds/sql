<?php declare(strict_types=1); // Strategy - helper Class

namespace App\Controller;

class SecureDataStore
{
    /**
     * @var mixed
     */
    public $file;

    /**
     * @var string
     */
    public $lines;

    /**
     * @return array
     */
    public function enterDataDepartment()
    {
        $this->file = file("postgres/data-db/departamentos.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($this->file as $this->lines)
        {
            $this->lines = explode(",", $this->lines);
            filter_var($this->lines, FILTER_SANITIZE_SPECIAL_CHARS);
        }
        return $this->file;
    }

    /**
     * @return array
     */
    public function enterDataLocalization()
    {
        $this->file = file("postgres/data-db/localizacao.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($this->file as $this->lines)
        {
            $this->lines = explode(",", $this->lines);
            filter_var($this->lines, FILTER_SANITIZE_SPECIAL_CHARS);
        }
        return $this->file;
    }

    /**
     * @return array
     */
    public function enterDataEmployee()
    {
        $this->file = file("postgres/data-db/funcionarios-no-id.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($this->file as $this->lines)
        {
            $this->lines = explode(",", $this->lines);
            filter_var($this->lines, FILTER_SANITIZE_SPECIAL_CHARS);
        }
        return $this->file;
    }

    /**
     * @return array
     */
    public function enterDataMachines()
    {
        $this->file = file("postgres/data-db/maquinas.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($this->file as $this->lines)
        {
            $this->lines = explode(",", $this->lines);
            filter_var($this->lines, FILTER_SANITIZE_SPECIAL_CHARS);
        }
        return $this->file;
    }

    /**
     * @return array
     */
    public function enterDataGender()
    {
        $this->file = file("postgres/data-db/genero.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($this->file as $this->lines)
        {
            $this->lines = explode(",", $this->lines);
            filter_var($this->lines, FILTER_SANITIZE_SPECIAL_CHARS);
        }
        return $this->file;
    }

    /**
     * @return array
     */
    public function enterDataFilm()
    {
        $this->file = file("postgres/data-db/filme.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($this->file as $this->lines)
        {
            $this->lines = explode(",", $this->lines);
            filter_var($this->lines, FILTER_SANITIZE_SPECIAL_CHARS);
        }
        return $this->file;
    }

    /**
     * @return array
     */
    public function enterDataLocation()
    {
        $this->file = file("postgres/data-db/locacao.txt", FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($this->file as $this->lines)
        {
            $this->lines = explode(",", $this->lines);
            filter_var($this->lines, FILTER_SANITIZE_SPECIAL_CHARS);
        }
        return $this->file;
    }
}
