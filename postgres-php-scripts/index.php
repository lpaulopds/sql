<?php declare(strict_types=1);

$time_start = microtime(true);

require '../vendor/autoload.php';

/**
 * CONEXÃO COM BANCO DE DADOS
 * Scripts para Postgres
 */
use \App\Connect\Connection as Connection;
try
{
    $pdo = Connection::get()->connect();
    print "Connected paste PSQL" . "<br> ----- <br>";
}
catch (\Exception $e) {
    print $e->getMessage();
}

/**
 * CLASSE DE CRIAÇÃO DO BANCO DE DADOS
 * CRIA BANCO DE DADOS loja
 */
// use \App\Controller\DatabaseCreator;
// new DatabaseCreator();
// die;

/**
 * CLASSE PARA CRIAÇÃO DE TABELAS
 */
use \App\Controller\CreateBusinessTables;
new CreateBusinessTables();
// die;

/**
 * CLASSE DE INSERÇÃO
 */
use \App\Model\InsertionsIntoTables as InsertionsIntoTables;
$insertDemo = new InsertionsIntoTables($pdo);

/**
 * INSERE DADOS NA TABELA departamentos
 */
try
{
    $fileDeps = fopen('../postgres/data-db/departamentos.txt', 'r');
    while (!feof($fileDeps)) {
        $resultsDeps[] = explode(",", fgets($fileDeps));
    }    
    fclose($fileDeps);

    foreach ($resultsDeps as $dataDeps)
    {
        $insertDemo->InsertIntoTableDeps([
            [
                'departamento' => $dataDeps[0],
                'divisao' => $dataDeps[1]
            ]
        ]);
        print_r($dataDeps);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}
print "<br> ----- <br>";

/**
 * INSERE DADOS NA TABELA localizacao
 */
try
{
    $fileLoca = fopen('../postgres/data-db/localizacao.txt', 'r');
    while (!feof($fileLoca)) {
        $resultsLoca[] = explode(",", fgets($fileLoca));
    }
    fclose($fileLoca);

    foreach ($resultsLoca as $dataLoca)
    {
        $insertDemo->InsertIntoTableLoca([
            [
                'idRegiao' => $dataLoca[0],
                'localizacao' => $dataLoca[1],
                'pais' => $dataLoca[2]
            ]
        ]);
        print_r($dataLoca);
        print "<br>";
    }
}
catch (\PDOException $e) {
    echo $e->getMessage();
}
print "<br> ----- <br>";

/**
 * INSERE DADOS NA TABELA funcionarios
 */
try
{
    $fileFunc = fopen('../postgres/data-db/funcionarios.txt', 'r');
    while (!feof($fileFunc)) {
        $resultsFunc[] = explode(",", fgets($fileFunc));
    }
    fclose($fileFunc);

    foreach ($resultsFunc as $dataFunc)
    {
        $insertDemo->InsertIntoTableFunc([
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
        print_r($dataFunc);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}
print "<br> ----- <br>";

/**
 * INSERE DADOS NA TABELA maquinas
 */
try
{
    $fileMach = fopen('../postgres/data-db/maquinas.txt', 'r');
    while (!feof($fileMach)) {
        $resultsMach[] = explode(",", fgets($fileMach));
    }
    fclose($fileMach);

    foreach ($resultsMach as $dataMach)
    {
        $insertDemo->InsertIntoTableMaqs([
            [
                'maquina' => $dataMach[0],
                'dia' => $dataMach[1],
                'qtd' => $dataMach[2]
            ]
        ]);
        print_r($dataMach);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}
print "<br> ----- <br>";

/**
 * INSERE DADOS NA TABELA GENERO
 */
try
{
    $fileGene = fopen('../postgres/data-db/genero.txt', 'r');
    while (!feof($fileGene)) {
        $resultsGene[] = explode(",", fgets($fileGene));
    }
    fclose($fileGene);

    foreach ($resultsGene as $dataGene)
    {
        $insertDemo->InsertIntoTableGene([
            [
                'IDGENERO' => $dataGene[0],
                'NOME' => $dataGene[1]
            ]
        ]);
        print_r($dataGene);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}
print "<br> ----- <br>";

/**
 * INSERE DADOS NA TABELA FILME
 */
try
{
    $fileFilm = fopen('../postgres/data-db/filme.txt', 'r');
    while (!feof($fileFilm)) {
        $resultsFilm[] = explode(",", fgets($fileFilm));
    }
    fclose($fileFilm);

    foreach ($resultsFilm as $dataFilm)
    {
        $insertDemo->InsertIntoTableFilm([
            [
                'IDFILME' => $dataFilm[0],
                'NOME' => $dataFilm[1],
                'ANO' => $dataFilm[2],
                'ID_GENERO' => $dataFilm[3]
            ]
        ]);
        print_r($dataFilm);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}
print "<br> ----- <br>";

/**
 * INSERE DADOS NA TABELA locacao
 */
try
{
    $fileLocacao = fopen('../postgres/data-db/locacao.txt', 'r');
    while (!feof($fileLocacao)) {
        $resultsLocacao[] = explode(",", fgets($fileLocacao));
    }
    fclose($fileLocacao);

    foreach ($resultsLocacao as $dataLocacao)
    {
        $insertDemo->InsertIntoTableLocacao([
            [
                'IDLOCACAO' => $dataLocacao[0],
                'DATA' => $dataLocacao[1],
                'MIDIA' => $dataLocacao[2],
                'DIAS' => $dataLocacao[3],
                'ID_FILME' => $dataLocacao[4]
            ]
        ]);
        print_r($dataLocacao);
        print "<br>";
    }
}
catch (\PDOException $e) {
    print $e->getMessage();
}
print "<br> ----- <br>";


$time_end = microtime(true);
$time = $time_end - $time_start;
print "Tempo de execução: " . $time . " segundos";
