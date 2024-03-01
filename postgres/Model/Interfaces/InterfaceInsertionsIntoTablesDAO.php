<?php declare(strict_types=1);

namespace App\Model\Interfaces;

interface InterfaceInsertionsIntoTablesDAO
{
    public function InsertIntoTableDeps($data);
    public function InsertIntoTableLoca($data);
    public function InsertIntoTableFunc($data);
    public function InsertIntoTableMaqs($data);
    public function InsertIntoTableGene($data);
    public function InsertIntoTableFilm($data);
    public function InsertIntoTableLocacao($data);
}
