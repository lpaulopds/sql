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

    public function search($value) {
        return $this->searchNode($this->root, $value);
    }

    private function searchNode($node, $value)
    {
        if ($node === null) {
            return $node;
        }
        elseif ($value < $node->value) {
            return $this->searchNode($node->left, $value);
        }
        elseif ($value > $node->value) {
            return $this->searchNode($node->right, $value);
        }
        else {
            return $node;
        }
    }

    public function remove($value) {
        $this->root = $this->removeNode($this->root, $value);
    }

    private function removeNode($node, $value)
    {
        if ($node === null) {
            return null;
        }
        elseif ($value < $node->value)
        {
            $node->left = $this->removeNode($node->left, $value);
            return $node;
        }
        elseif ($value > $node->value)
        {
            $node->right = $this->removeNode($node->right, $value);
            return $node;
        }
        else
        {
            if ($node->left === null && $node->right === null) {
                return null;
            }
            elseif ($node->left === null) {
                return $node->right;
            }
            elseif ($node->right === null) {
                return $node->left;
            }
            else
            {
                $minRightNode = $this->findMinNode($node->right);
                $node->value = $minRightNode->value;
                $node->right = $this->removeNode($node->right, $minRightNode->value);
                return $node;
            }
        }
    }

    private function findMinNode($node)
    {
        while ($node->left !== null) {
            $node = $node->left;
        }
        return $node;
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
