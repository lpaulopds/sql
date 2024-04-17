<?php declare(strict_types=1);

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

    // public function getSelect() {
    //     return $this->setSelect();
    // }

    private function setSelectItens()
    {
        // $this->obSelect = $this->setEmployeeSelect();
        $content = '';

        // while ($obSel = $this->obSelect->algorithm(array(0)))
        // {
        //     // print $obSel['nome'];
        //     $content .= View::render('view/itens', [
        //         'nome' => $obSel['nome'],
        //         'email' => $obSel['email'],
        //         'departamento' => $obSel['departamento'],
        //         'cargo' => $obSel['cargo'],
        //         'localizacao' => $obSel['localizacao']
        //     ]);
        // }

        // print $content;
    }

    public function setSelect()
    {
        // $content = View::render('view/employee-table', [
        //     'itens' => $this->setSelectItens()
        // ]);
        // print $content;
        // print parent::getPage('Employee Table', $content);
    }

    private function setEmployeeSelect()
    {
        $this->select = new EmployeeSelect();
        return $this->select;
    }
}
