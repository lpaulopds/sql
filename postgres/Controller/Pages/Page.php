<?php declare(strict_types=1);

namespace App\Controller\Pages;

use App\Utils\View;

class Page
{
    /**
     * @return string
     */
    public static function getHeader() {
        return View::render('view/header', [
            'header' => 'Conteúdo do header'
        ]);
    }

    /**
     * @return string
     */
    public static function getFooter() {
        return View::render('view/footer', [
            'footer' => 'Conteúdo do footer'
        ]);
    }

    /**
     * @return string
     */
    public static function getPage($title, $content)
    {
        return View::render('view/page', [
            'title' => $title,
            'header' => self::getHeader(),
            'content' => $content,
            'footer' => self::getFooter()
        ]);
    }
}
