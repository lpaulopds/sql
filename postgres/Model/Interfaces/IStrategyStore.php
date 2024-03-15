<?php declare(strict_types=1); // Interface Strategy Store

namespace App\Model\Interfaces;

interface IStrategyStore {
    const TABLEDEPART = "departamentos";
    const TABLELOCALIZATION = "localizacao";
    const TABLEEMPLOYEE = "funcionarios";
    const TABLEMACHINES = "maquinas";
    const TABLEGENDER = "genero";
    const TABLEFILM = "filme";
    const TABLELOCATION = "locacao";

    public function algorithm(Array $dataPack);
}
