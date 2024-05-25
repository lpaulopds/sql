<?php declare(strict_types=1); // By ChatGPT

namespace App\BinaryTree;

use App\BinaryTree\BinaryTree;

class ClientBinaryTree
{
    public function __construct()
    {
        $tree = new BinaryTree();
        $tree->insert(10);
        $tree->insert(5);
        $tree->insert(20);
        $tree->insert(3);
        $tree->insert(7);
        $tree->insert(15);
        $tree->insert(25);

        echo "In-order traversal: ";
        $tree->inorderTraversal($tree->root);
        echo "<br> Pre-order traversal: ";
        $tree->preorderTraversal($tree->root);
        echo "<br> Post-order traversal: ";
        $tree->postorderTraversal($tree->root);
        echo "<br>";
        
        $searchValue = 15;
        $foundNode = $tree->search($searchValue);
        echo $foundNode ?
            "Node $searchValue found.<br>" :
                "Node $searchValue not found.<br>";
        
        $removeValue = 20;
        $tree->remove($removeValue);
        echo "After removing $removeValue, <br>In-order traversal: ";
        $tree->inorderTraversal($tree->root);
        echo "<br>";
    }
}

// new ClientBinaryTree();
