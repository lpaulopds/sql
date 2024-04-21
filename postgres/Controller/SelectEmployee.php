<?php declare(strict_types=1); // Strategy - Controller

namespace App\Controller;

use App\Utils\View; 
use App\Controller\Pages\Page;
use App\Model\EmployeeSelect;

class SelectEmployee extends Page
{
    /**
     * @var array
     */
    private $select;

    /**
     * @var EmployeeSelect
     */
    private $obSelect;

    /**
     * @var array
     */
    private $object;

    /**
     * @var string
     */
    private $content;

    /**
     * @var string
     */
    private $employee;

    /**
     * Retorna classe Model
     * @return EmployeeSelect
     */
    private function setEmployeeSelect()
    {
        $this->select = new EmployeeSelect();
        return $this->select;
    }

    /**
     * Retorna tabela com seleção de funcionários
     * @return string
     */
    public function getSelect() {
        return $this->setSelect();
    }

    /**
     * Retorna dados de funcionário
     * @return string
     */
    private function setSelectItens()
    {
        $this->obSelect = $this->setEmployeeSelect();
        $this->object = $this->obSelect->algorithm(array(0));
        $this->content = '';

        foreach ($this->object as $this->employee)
        {
            $this->content .= View::render('view/itens', [
                'nome' => $this->employee['nome'],
                'email' => $this->employee['email'],
                'departamento' => $this->employee['departamento'],
                'cargo' => $this->employee['cargo'],
                'localizacao' => $this->employee['localizacao']
            ]);
        }

        return $this->content;
    }

    /**
     * Retorna tabela com dados de funcionário
     * @return string
     */
    public function setSelect()
    {
        $this->content = View::render('view/employee-table', [
            'itens' => $this->setSelectItens()
        ]);

        print parent::getPage('Employee Table', $this->content);
    }
}
