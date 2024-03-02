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
    private $fileDeps;

    /**
     * @var array
     */
    private $resultsDeps;

    /**
     * @var resource
     */
    private $fileLoca;

    /**
     * @var array
     */
    private $resultsLoca;

    /**
     * @var resource
     */
    private $fileFunc;

    /**
     * @var array
     */
    private $resultsFunc;

    /**
     * @var resource
     */
    private $fileMach;

    /**
     * @var array
     */
    private $resultsMach;

    /**
     * @var resource
     */
    private $fileGene;

    /**
     * @var array
     */
    private $resultsGene;

    /**
     * @var resource
     */
    private $fileFilm;

    /**
     * @var array
     */
    private $resultsFilm;

    /**
     * @var resource
     */
    private $fileLocacao;

    /**
     * @var array
     */
    private $resultsLocacao;

    /**
     * @return mixed
     */
    public function __construct()
    {
        echo "<pre>";
        print 'Propriedades da tabela departamentos<br>';
        print_r($this->getInsertInDeps());
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela localizacao<br>';
        print_r($this->getInsertInLocalizacao());
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela funcionarios<br>';
        print_r($this->getInsertInFunc());
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela maquinas<br>';
        print_r($this->getInsertInMaquinas());
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela genero<br>';
        print_r($this->getInsertInGenero());
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela Filme<br>';
        print_r($this->getInsertInFilme());
        echo "</pre>";

        echo "<pre>";
        print 'Propriedades da tabela Locacao<br>';
        print_r($this->getInsertInLocacao());
        echo "</pre>";
    }

    private function getInsertInDeps(): array {
        return $this->setInsertInDeps();
    }

    private function setInsertInDeps(): array
    {
        $this->fileDeps = fopen('../postgres/data-db/departamentos.txt', 'r');
        while (!feof($this->fileDeps)) {
            $this->resultsDeps[] = explode(",", fgets($this->fileDeps));
        }    
        fclose($this->fileDeps);

        foreach ($this->resultsDeps as $dataDeps)
        {
            $this->instanceInsertionsIntoTables()->InsertIntoTableDeps([
                [
                    'departamento' => $dataDeps[0],
                    'divisao' => $dataDeps[1]
                ]
            ]);
        }
        return $this->resultsDeps;
    }

    private function getInsertInLocalizacao(): array {
        return $this->setInsertInLocalizacao();
    }

    private function setInsertInLocalizacao(): array
    {
        $this->fileLoca = fopen('../postgres/data-db/localizacao.txt', 'r');
        while (!feof($this->fileLoca)) {
            $this->resultsLoca[] = explode(",", fgets($this->fileLoca));
        }
        fclose($this->fileLoca);

        foreach ($this->resultsLoca as $dataLoca)
        {
            $this->instanceInsertionsIntoTables()->InsertIntoTableLoca([
                [
                    'idRegiao' => $dataLoca[0],
                    'localizacao' => $dataLoca[1],
                    'pais' => $dataLoca[2]
                ]
            ]);
        }
        return $this->resultsLoca;
    }

    private function getInsertInFunc(): array {
        return $this->setInsertInFunc();
    }

    private function setInsertInFunc(): array
    {
        $this->fileFunc = fopen('../postgres/data-db/funcionarios.txt', 'r');
        while (!feof($this->fileFunc)) {
            $this->resultsFunc[] = explode(",", fgets($this->fileFunc));
        }
        fclose($this->fileFunc);

        foreach ($this->resultsFunc as $dataFunc)
        {
            $this->instanceInsertionsIntoTables()->InsertIntoTableFunc([
                [
                    'idFuncionario' => $dataFunc[0],
                    'nome' => $dataFunc[1],
                    'email' => $dataFunc[2],
                    'sexo' => $dataFunc[3],
                    'departamento' => $dataFunc[4],
                    'admissao' => $dataFunc[5],
                    'salario' => $dataFunc[6],
                    'cargo' => $dataFunc[7],
                    'idRegiao' => $dataFunc[8]
                ]
            ]);
        }
        return $this->resultsFunc;
    }

    private function getInsertInMaquinas(): array {
        return $this->setInsertInMaquinas();
    }

    private function setInsertInMaquinas(): array
    {
        $this->fileMach = fopen('../postgres/data-db/maquinas.txt', 'r');
        while (!feof($this->fileMach)) {
            $this->resultsMach[] = explode(",", fgets($this->fileMach));
        }
        fclose($this->fileMach);

        foreach ($this->resultsMach as $dataMach)
        {
            $this->instanceInsertionsIntoTables()->InsertIntoTableMaqs([
                [
                    'maquina' => $dataMach[0],
                    'dia' => $dataMach[1],
                    'qtd' => $dataMach[2]
                ]
            ]);
        }
        return $this->resultsMach;
    }

    private function getInsertInGenero(): array {
        return $this->setInsertInGenero();
    }

    private function setInsertInGenero(): array
    {
        $this->fileGene = fopen('../postgres/data-db/genero.txt', 'r');
        while (!feof($this->fileGene)) {
            $this->resultsGene[] = explode(",", fgets($this->fileGene));
        }
        fclose($this->fileGene);

        foreach ($this->resultsGene as $dataGene)
        {
            $this->instanceInsertionsIntoTables()->InsertIntoTableGene([
                [
                    'IDGENERO' => $dataGene[0],
                    'NOME' => $dataGene[1]
                ]
            ]);
        }
        return $this->resultsGene;
    }

    private function getInsertInFilme(): array {
        return $this->setInsertInFilme();
    }

    private function setInsertInFilme(): array
    {
        $this->fileFilm = fopen('../postgres/data-db/filme.txt', 'r');
        while (!feof($this->fileFilm)) {
            $this->resultsFilm[] = explode(",", fgets($this->fileFilm));
        }
        fclose($this->fileFilm);

        foreach ($this->resultsFilm as $dataFilm)
        {
            $this->instanceInsertionsIntoTables()->InsertIntoTableFilm([
                [
                    'IDFILME' => $dataFilm[0],
                    'NOME' => $dataFilm[1],
                    'ANO' => $dataFilm[2],
                    'ID_GENERO' => $dataFilm[3]
                ]
            ]);
        }
        return $this->resultsFilm;
    }

    private function getInsertInLocacao(): array {
        return $this->setInsertInLocacao();
    }

    private function setInsertInLocacao(): array
    {
        $this->fileLocacao = fopen('../postgres/data-db/locacao.txt', 'r');
        while (!feof($this->fileLocacao)) {
            $this->resultsLocacao[] = explode(",", fgets($this->fileLocacao));
        }
        fclose($this->fileLocacao);

        foreach ($this->resultsLocacao as $dataLocacao)
        {
            $this->instanceInsertionsIntoTables()->InsertIntoTableLocacao([
                [
                    'IDLOCACAO' => $dataLocacao[0],
                    'DATA' => $dataLocacao[1],
                    'MIDIA' => $dataLocacao[2],
                    'DIAS' => $dataLocacao[3],
                    'ID_FILME' => $dataLocacao[4]
                ]
            ]);
        }
        return $this->resultsLocacao;
    }

    private function instanceInsertionsIntoTables(): \App\Model\InsertionsIntoTables
    {
        $this->insert = new Insertion($this->setDBConn());
        return $this->insert;
    }

    private function setDBConn(): \PDO
    {
        ($this->pdo = Connection::get()->connect()) ??
            throw new \PDOException("Not connected.");
        return $this->pdo;
    }
}
