<?php declare(strict_types=1);

class Node
{
    public $value, $left, $right;
    // public $left;
    // public $right;

    public function __construct($value)
    {
        $this->value = $value;
        $this->left = null;
        $this->right = null;
    }
}
