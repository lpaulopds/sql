<?php declare(strict_types=1); // By ChatGPT

namespace App\BinaryTree;

class BinaryTree
{
    public $root;

    public function __construct() {
        $this->root = null;
    }

    public function insert($value)
    {
        $newNode = new Node($value);
        
        $this->root === null ?
            $this->root = $newNode :
                $this->insertNode($this->root, $newNode);
    }

    private function insertNode($node, $newNode)
    {
        if ($newNode->value < $node->value)
        {
            $node->left === null ?
                $node->left = $newNode :
                    $this->insertNode($node->left, $newNode);
        }
        else
        {
            $node->right === null ?
                $node->right = $newNode :
                    $this->insertNode($node->right, $newNode);
        }
    }

    public function inorderTraversal($node)
    {
        if ($node !== null)
        {
            $this->inorderTraversal($node->left);
            echo $node->value . " ";
            $this->inorderTraversal($node->right);
        }
    }

    public function preorderTraversal($node)
    {
        if ($node !== null)
        {
            echo $node->value . " ";
            $this->preorderTraversal($node->left);
            $this->preorderTraversal($node->right);
        }
    }

    public function postorderTraversal($node)
    {
        if ($node !== null)
        {
            $this->postorderTraversal($node->left);
            $this->postorderTraversal($node->right);
            echo $node->value . " ";
        }
    }
}
