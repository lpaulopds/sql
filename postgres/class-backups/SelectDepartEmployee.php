<?php declare(strict_types=1); // Strategy - Concret

namespace App\Controller;

use App\Model\SelectMenuDepart;

class SelectDepartEmployee
{
    /**
     * @var array
     */
    private $select;

    /**
     * @var SelectMenuDepart
     */
    private $obSelect;

    public function getSelect() {
        return $this->setSelect();
    }

    private function setSelect()
    {
        $this->obSelect = $this->setSelectMenuDepart();
        return $this->obSelect->algorithm(array(0));
    }

    private function setSelectMenuDepart()
    {
        $this->select = new SelectMenuDepart();
        return $this->select;
    }
}
