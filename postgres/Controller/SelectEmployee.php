<?php declare(strict_types=1); // Strategy - Controller

namespace App\Controller;

use App\Model\EmployeeSelect;
use App\Utils\View; 
use App\Controller\Pages\Page;

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

    public function getSelect() {
        return $this->setSelect();
    }

    /**
     * @return string
     */
    private function setSelectItens()
    {
        $this->obSelect = $this->setEmployeeSelect();
        $content = '';

        foreach ($this->obSelect->algorithm(array(0)) as $value)
        {
            $content .= View::render('view/itens', [
                'nome' => $value['nome'],
                'email' => $value['email'],
                'departamento' => $value['departamento'],
                'cargo' => $value['cargo'],
                'localizacao' => $value['localizacao']
            ]);
        }

        return $content;
    }

    /**
     * @return string
     */
    public function setSelect()
    {
        $content = View::render('view/employee-table', [
            'itens' => $this->setSelectItens()
        ]);

        print parent::getPage('Employee Table', $content);
    }

    /**
     * @return EmployeeSelect
     */
    private function setEmployeeSelect()
    {
        $this->select = new EmployeeSelect();
        return $this->select;
    }
}
