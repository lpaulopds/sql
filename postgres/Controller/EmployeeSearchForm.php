<?php declare(strict_types=1); // Employee Search Controller

namespace App\Controller;

use App\Utils\View; 
use App\Controller\Pages\Page;

class EmployeeSearchForm extends Page
{
    /**
     * @var string
     */
    private $content;

    /**
     * Retorna formulário de busca de funcionário
     * @return string
     */
    public function setEmployeeSearchForm()
    {
        $this->content = View::render('view/search-employee', [
            'labelSearch' => 'Busque funcionários por nome ou e-mail'
        ]);

        print parent::getPage('Employee Seach', $this->content);
    }
}
