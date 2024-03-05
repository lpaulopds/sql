<?php declare(strict_types=1);

namespace App\Controller;

use \App\Connect\Connection as Connection;
use \App\Model\InsertionsIntoTables as Insertion;

class InsertInTables
{
    /**
     * @var \PDO
     */
    private $pdo;

    /**
     * @var \App\Model\InsertionsIntoTables $insert
     */
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
     * @var string
     */
    public $data;

    /**
     * @return mixed
     */
    public function __construct()
    {
        echo "<pre>";
        print 'Propriedades da tabela departamentos<br>';
        $this->getInsertInDeps();
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela localizacao<br>';
        $this->getInsertInLocalizacao();
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela funcionarios<br>';
        $this->getInsertInFunc();
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela maquinas<br>';
        $this->getInsertInMaquinas();
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela genero<br>';
        $this->getInsertInGenero();
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela Filme<br>';
        $this->getInsertInFilme();
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela Locacao<br>';
        $this->getInsertInLocacao();
        echo "</pre>";
    }

    /**
     * @return string
     */
    private function getInsertInDeps() {
        return $this->setInsertInDeps();
    }

    /**
     * @return string
     */
    private function setInsertInDeps()
    {
        $this->file = fopen('../postgres/data-db/departamentos.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->data = explode(',', $this->lines);

            filter_var($this->data[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[1], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->instaInseIntoTables()->InsertIntoTableDeps([
                [
                    'departamento' => $this->data[0],
                    'divisao' => $this->data[1]
                ]
            ]);
            print_r($this->data);
        }
        fclose($this->file);
    }

    /**
     * @return string
     */
    private function getInsertInLocalizacao() {
        return $this->setInsertInLocalizacao();
    }

    /**
     * @return string
     */
    private function setInsertInLocalizacao()
    {
        $this->file = fopen('../postgres/data-db/localizacao.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->data = explode(',', $this->lines);

            filter_var($this->data[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[2], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->instaInseIntoTables()->InsertIntoTableLoca([
                [
                    'idRegiao' => $this->data[0],
                    'localizacao' => $this->data[1],
                    'pais' => $this->data[2]
                ]
            ]);
            print_r($this->data);
        }
        fclose($this->file);
    }

    /**
     * @return string
     */
    private function getInsertInFunc() {
        return $this->setInsertInFunc();
    }

    /**
     * @return string
     */
    private function setInsertInFunc()
    {
        $this->file = fopen('../postgres/data-db/funcionarios.txt', 'r');
        $this->batchSize = 100;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->data = explode(',', $this->lines);

            filter_var($this->data[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[2], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[3], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[4], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[5], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[6], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[7], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[8], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->instaInseIntoTables()->InsertIntoTableFunc([
                [
                    'idFuncionario' => $this->data[0],
                    'nome' => $this->data[1],
                    'email' => $this->data[2],
                    'sexo' => $this->data[3],
                    'departamento' => $this->data[4],
                    'admissao' => $this->data[5],
                    'salario' => $this->data[6],
                    'cargo' => $this->data[7],
                    'idRegiao' => $this->data[8]
                ]
            ]);
            print_r($this->data); 
        }
        fclose($this->file);
    }

    /**
     * @return string
     */
    private function getInsertInMaquinas() {
        return $this->setInsertInMaquinas();
    }

    /**
     * @return string
     */
    private function setInsertInMaquinas()
    {
        $this->file = fopen('../postgres/data-db/maquinas.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->data = explode(',', $this->lines);

            filter_var($this->data[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[2], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->instaInseIntoTables()->InsertIntoTableMaqs([
                [
                    'maquina' => $this->data[0],
                    'dia' => $this->data[1],
                    'qtd' => $this->data[2]
                ]
            ]);
            print_r($this->data);
        }
        fclose($this->file);
    }

    /**
     * @return string
     */
    private function getInsertInGenero() {
        return $this->setInsertInGenero();
    }

    /**
     * @return string
     */
    private function setInsertInGenero()
    {
        $this->file = fopen('../postgres/data-db/genero.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->data = explode(',', $this->lines);

            filter_var($this->data[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[1], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->instaInseIntoTables()->InsertIntoTableGene([
                [
                    'IDGENERO' => $this->data[0],
                    'NOME' => $this->data[1]
                ]
            ]);
            print_r($this->data);
        }
        fclose($this->file);
    }

    /**
     * @return string
     */
    private function getInsertInFilme() {
        return $this->setInsertInFilme();
    }

    /**
     * @return string
     */
    private function setInsertInFilme()
    {
        $this->file = fopen('../postgres/data-db/filme.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->data = explode(',', $this->lines);

            filter_var($this->data[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[2], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[3], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->instaInseIntoTables()->InsertIntoTableFilm([
                [
                    'IDFILME' => $this->data[0],
                    'NOME' => $this->data[1],
                    'ANO' => $this->data[2],
                    'ID_GENERO' => $this->data[3]
                ]
            ]);
            print_r($this->data);
        }
        fclose($this->file);
    }

    /**
     * @return string
     */
    private function getInsertInLocacao() {
        return $this->setInsertInLocacao();
    }

    /**
     * @return string
     */
    private function setInsertInLocacao()
    {
        $this->file = fopen('../postgres/data-db/locacao.txt', 'r');
        $this->batchSize = 10;

        while (!feof($this->file) && !feof($this->file) <= $this->batchSize)
        {
            $this->lines = fgets($this->file);
            $this->data = explode(',', $this->lines);

            filter_var($this->data[0], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[1], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[2], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[3], FILTER_SANITIZE_SPECIAL_CHARS);
            filter_var($this->data[4], FILTER_SANITIZE_SPECIAL_CHARS);

            $this->instaInseIntoTables()->InsertIntoTableLocacao([
                [
                    'IDLOCACAO' => $this->data[0],
                    'DATA' => $this->data[1],
                    'MIDIA' => $this->data[2],
                    'DIAS' => $this->data[3],
                    'ID_FILME' => $this->data[4]
                ]
            ]);
            print_r($this->data);
        }
        fclose($this->file);
    }

    /**
     * @return \App\Model\InsertionsIntoTables
     */
    private function instaInseIntoTables(): \App\Model\InsertionsIntoTables
    {
        $this->insert = new Insertion($this->setDBConn());
        return $this->insert;
    }

    /**
     * @return \PDO
     */
    private function setDBConn(): \PDO
    {
        ($this->pdo = Connection::get()->connect()) ??
            throw new \PDOException("Not connected.");
        return $this->pdo;
    }
}
