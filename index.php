<?php 
// echo "<pre>";
// print_r($_SERVER);
// echo "</pre>";
// phpinfo();
// die;

require __DIR__ . '/vendor/autoload.php';

/**
 * CONEXÃO COM BANCO DE DADOS
 */
use \App\Connect\Connection as Connection;
try
{
    $pdo = Connection::get()->connect();
    print "Connected" . "<br> ----- <br>";
}
catch (\PDOException $e) {
    print $e->getMessage();
}
/**
 * CLASSE DE CRIAÇÃO DO BANCO DE DADOS
 * CRIA BANCO DE DADOS loja
 */
// use \App\Model\CreateDatabase as CreateDatabase;
// try
// {
//     $databaseCreator = new CreateDatabase($pdo);
//     $database = $databaseCreator->createDB();

//     $database ? print 'Created Database' :
//          print 'Error in query create database';

//     foreach ($database as $db) {
//         print $db . '<br>';
//     }
// }
// catch (\PDOException $e) {
//     print $e->getMessage();
// }
// die;

/**
 * CLASSE PARA CRIAÇÃO DE TABELAS
 */
use \App\Model\CreateTables as CreateTables;
$tablesCreator = new CreateTables($pdo);

/**
 * CRIA TABELAS DEPARTAMENTO
 */
try
{
    $tables = $tablesCreator->createTables();
    $tables ? print 'Created Tables departamento <br> ----- <br>' :
        print 'Error in query create table';
}
catch (\PDOException $e) {
    print $e->getMessage();
}

/**
 * CRIA TABELAS LOCADORA
 */
try
{
    $tablesLocadora = $tablesCreator->createTablesLocadora();
    $tablesLocadora ? print 'Created Tables Locadora.<br><br> ----- <br>' :
        print 'Error in query create table';
}
catch (\PDOException $e) {
    print $e->getMessage();
}

/**
 * MOSTRA NOMES DAS TABELAS DO BANCO DE DADOS
 */
$descTables = $tablesCreator->getTables();
print_r($descTables);
print '<br><br> ----- <br>';

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
    $fileDeps = fopen('postgres/data-db/departamentos.txt', 'r');
    while (!feof($fileDeps)) {
        $resultsDeps[] = explode(",", fgets($fileDeps));
    }    
    fclose($fileDeps);

    foreach ($resultsDeps as $dataDeps)
    {
        $listDeps = $insertDemo->InsertIntoTableDeps([
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
    $fileLoca = fopen('postgres/data-db/localizacao.txt', 'r');
    while (!feof($fileLoca)) {
        $resultsLoca[] = explode(",", fgets($fileLoca));
    }
    fclose($fileLoca);

    foreach ($resultsLoca as $dataLoca)
    {
        $listLoca = $insertDemo->InsertIntoTableLoca([
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
    $fileFunc = fopen('postgres/data-db/funcionarios.txt', 'r');
    while (!feof($fileFunc)) {
        $resultsFunc[] = explode(",", fgets($fileFunc));
    }
    fclose($fileFunc);

    foreach ($resultsFunc as $dataFunc)
    {
        $listFunc = $insertDemo->InsertIntoTableFunc([
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
    $fileMach = fopen('postgres/data-db/maquinas.txt', 'r');
    while (!feof($fileMach)) {
        $resultsMach[] = explode(",", fgets($fileMach));
    }
    fclose($fileMach);

    foreach ($resultsMach as $dataMach)
    {
        $listMach = $insertDemo->InsertIntoTableMaqs([
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
    $fileGene = fopen('postgres/data-db/genero.txt', 'r');
    while (!feof($fileGene)) {
        $resultsGene[] = explode(",", fgets($fileGene));
    }
    fclose($fileGene);

    foreach ($resultsGene as $dataGene)
    {
        $listGene = $insertDemo->InsertIntoTableGene([
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
    $fileFilm = fopen('postgres/data-db/filme.txt', 'r');
    while (!feof($fileFilm)) {
        $resultsFilm[] = explode(",", fgets($fileFilm));
    }
    fclose($fileFilm);

    foreach ($resultsFilm as $dataFilm)
    {
        $listFilm = $insertDemo->InsertIntoTableFilm([
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
    $fileLocacao = fopen('postgres/data-db/locacao.txt', 'r');
    while (!feof($fileLocacao)) {
        $resultsLocacao[] = explode(",", fgets($fileLocacao));
    }
    fclose($fileLocacao);

    foreach ($resultsLocacao as $dataLocacao)
    {
        $listLocacao = $insertDemo->InsertIntoTableLocacao([
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

/**
 * TEMPO DE EXECUÇÃO
 */
// sleep(3);
$tempo = time() - $_SERVER["REQUEST_TIME_FLOAT"];
printf("%0.16f segs", $tempo/1000000);
print "<br><br><br>";
