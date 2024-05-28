<?php declare(strict_types=1); // By ChatGPT

namespace App\BinaryTree;

class Node
{
    public $value, $left, $right;

    public function __construct($value)
    {
        $this->value = $value;
        $this->left = null;
        $this->right = null;
    }
}