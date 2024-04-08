<?php declare(strict_types=1);

namespace App\Utils;

class View
{
    /**
     * @var array
     */
    public $vars = [];

    /**
     * @param string
     * @return string
     */
    public static function getContentView($view)
    {
        $file = __DIR__.'/../../postgres/resources/'.$view.'.html';
        return file_exists($file) ? file_get_contents($file) : '';
    }

    /**
     * @param string
     * @param array
     * @return string
     */
    public static function render($view, $vars = [])
    {        
        $contentView = self::getContentView($view);

        $keys = array_keys($vars);

        $keys = array_map(function($item) {
            return '{{' . $item . '}}';
        }, $keys);

        return str_replace($keys, array_values($vars), $contentView);
    }
}
