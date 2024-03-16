<?php declare(strict_types=1);

namespace App\Model;
use App\Model\Interfaces\IInsertionsIntoTablesDAO;

/**
 * Insert data in PostgreSQL tables.
 */
class InsertionsIntoTables implements IInsertionsIntoTablesDAO
{
    /**
     * PDO object
     * @var \PDO
     */
    private $pdo;

    /**
     * init the object with a \PDO object
     * @param type $pdo
     */
    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    /**
     * Insert multiples Deps into table departamentos
     * @param array $data
     * @return array
     */
    public function InsertIntoTableDeps($data)
    {
        $this->pdo->beginTransaction();
        $sql = 'INSERT INTO departamentos(departamento, divisao)
                    VALUES (:V1, :V2)';
        $stmt = $this->pdo->prepare($sql);

        foreach ($data as $list)
        {
            $stmt->bindValue(':V1', $list['departamento']);
            $stmt->bindValue(':V2', $list['divisao']);
            $stmt->execute();
            ($this->pdo->commit()) ?? $this->pdo->rollBack();
        }
    }

    /**
     * Insert multiples Locations into table localização
     * @param array $data
     * @return array
     */
    public function InsertIntoTableLoca($data)
    {
        $this->pdo->beginTransaction();
        $sql = 'INSERT INTO localizacao(idRegiao, localizacao, pais)
                    VALUES (:V0, :V1, :V2)';
        $stmt = $this->pdo->prepare($sql);

        foreach ($data as $list)
        {
            $stmt->bindValue(':V0', $list['idRegiao']);
            $stmt->bindValue(':V1', $list['localizacao']);
            $stmt->bindValue(':V2', $list['pais']);
            $stmt->execute();
            ($this->pdo->commit()) ?? $this->pdo->rollBack();
        }
    }

    /**
     * Insert multiples funcionários into table funcionarios
     * @param array $data
     * @return array
     */
    public function InsertIntoTableFunc($data)
    {
        $this->pdo->beginTransaction();
        $sql = 'INSERT INTO funcionarios(nome, email, sexo, departamento, admissao,
                            salario, cargo, idRegiao, dataRegistro, horaRegistro)
                        VALUES (:V0, :V1, :V2, :V3, :V4, :V5, :V6, :V7, :V8, :V9)';
        $stmt = $this->pdo->prepare($sql);

        date_default_timezone_set('America/Sao_Paulo');
        $dataReg = date('Y-m-d');
        $horaReg = date('H:m:s');

        foreach ($data as $list)
        {
            $stmt->bindValue(':V0', $list['nome']);
            $stmt->bindValue(':V1', $list['email']);
            $stmt->bindValue(':V2', $list['sexo']);
            $stmt->bindValue(':V3', $list['departamento']);
            $stmt->bindValue(':V4', $list['admissao']);
            $stmt->bindValue(':V5', $list['salario']);
            $stmt->bindValue(':V6', $list['cargo']);
            $stmt->bindValue(':V7', $list['idRegiao']);
            $stmt->bindValue(':V8', $dataReg);
            $stmt->bindValue(':V9', $horaReg);
            $stmt->execute();
            ($this->pdo->commit()) ?? $this->pdo->rollBack();
        }
    }

    /**
     * Insert multiples logs into table funcionarios
     * @param array $data
     * @return array
     */
    public function InsertIntoTableMaqs($data)
    {
        $this->pdo->beginTransaction();
        $sql = 'INSERT INTO maquinas(maquina, dia, qtd)
                    VALUES (:V1,:V2,:V3)';
        $stmt = $this->pdo->prepare($sql);

        foreach ($data as $list)
        {
            $stmt->bindValue(':V1', $list['maquina']);
            $stmt->bindValue(':V2', $list['dia']);
            $stmt->bindValue(':V3', $list['qtd']);
            $stmt->execute();
            ($this->pdo->commit()) ?? $this->pdo->rollBack();
        }
    }

    /**
     * Insert multiples genero into table GENERO
     * @param array $data
     * @return array
     */
    public function InsertIntoTableGene($data)
    {
        $this->pdo->beginTransaction();
        $sql = 'INSERT INTO GENERO(IDGENERO, NOME)
                    VALUES (:V0, :V1)';
        $stmt = $this->pdo->prepare($sql);

        foreach ($data as $list)
        {
            $stmt->bindValue(':V0', $list['IDGENERO']);
            $stmt->bindValue(':V1', $list['NOME']);
            $stmt->execute();
            ($this->pdo->commit()) ?? $this->pdo->rollBack();
        }
    }

    /**
     * Insert multiples filme into table FILME
     * @param array $data
     * @return array
     */
    public function InsertIntoTableFilm($data)
    {
        $this->pdo->beginTransaction();
        $sql = 'INSERT INTO FILME(IDFILME, NOME, ANO, ID_GENERO)
                    VALUES (:V0, :V1, :V2, :V3)';
        $stmt = $this->pdo->prepare($sql);

        foreach ($data as $list)
        {
            $stmt->bindValue(':V0', $list['IDFILME']);
            $stmt->bindValue(':V1', $list['NOME']);
            $stmt->bindValue(':V2', $list['ANO']);
            $stmt->bindValue(':V3', $list['ID_GENERO']);
            $stmt->execute();
            ($this->pdo->commit()) ?? $this->pdo->rollBack();
        }
    }

    /**
     * Insert multiples locacao into table LOCACAO
     * @param array $data
     * @return array
     */
    public function InsertIntoTableLocacao($data)
    {
        $this->pdo->beginTransaction();
        $sql = 'INSERT INTO LOCACAO(IDLOCACAO, DATA, MIDIA, DIAS, ID_FILME)
                    VALUES (:V0, :V1, :V2, :V3, :V4)';
        $stmt = $this->pdo->prepare($sql);

        foreach ($data as $list)
        {
            $stmt->bindValue(':V0', $list['IDLOCACAO']);
            $stmt->bindValue(':V1', $list['DATA']);
            $stmt->bindValue(':V2', $list['MIDIA']);
            $stmt->bindValue(':V3', $list['DIAS']);
            $stmt->bindValue(':V4', $list['ID_FILME']);
            $stmt->execute();
            ($this->pdo->commit()) ?? $this->pdo->rollBack();
        }
    }
}
