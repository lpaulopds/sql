<?php declare(strict_types=1);

use App\BinaryTree\BinaryTree;

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
echo "<br>";
