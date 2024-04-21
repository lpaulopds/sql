<?php declare(strict_types=1); // Strategy - Controller

namespace App\Controller;

use App\Utils\View; 
use App\Controller\Pages\Page;
use App\Model\SelectMenuDepart;

class EmployeeInsertForm extends Page
{
    /**
     * @var array
     */
    private $select;

    /**
     * @var SelectMenuDepart
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
    private $departs;

    /**
     * Instância da classe Model
     * @return array
     */
    private function setSelectMenuDepart()
    {
        $this->select = new SelectMenuDepart();
        return $this->select;
    }

    /**
     * Retorna departamentos
     * @return string
     */
    private function setMenuDepart()
    {
        $this->obSelect = $this->setSelectMenuDepart();
        $this->object = $this->obSelect->algorithm(array(0));
        $this->content = '';

        foreach ($this->object as $this->departs)
        {
            $this->content .= View::render('view/menu-select', [
                'departs' => $this->departs['departamento']
            ]);
        }

        return $this->content;
    }

    /**
     * Retorna formulário de inserção
     * @return string
     */
    public function EmployeeInsertForm()
    {
        $this->content = View::render('view/employee-insert-form', [
            'menuSelect' => $this->setMenuDepart()
        ]);

        print parent::getPage('Employee Insert', $this->content);
    }
}
