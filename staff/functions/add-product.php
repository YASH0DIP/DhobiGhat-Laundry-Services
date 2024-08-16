<?php
include_once 'connection.php';
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['id'])){
    header('Location: ../transaction.php?type=error&message=User Not Logged in!');
    exit();
}

$user_id = $_SESSION['id'];
$item_id = $_POST['item'];
$transaction_id = $_POST['id'];
$qty = $_POST['qty'];
$_SESSION['comments'] = $_POST['comments'];

if ($qty <= 0){
    header('Location: ../transaction.php?type=error&message=Invalid Quantity!');
    exit();
}

$sql = "SELECT * FROM transactions WHERE id = :id";
$stmt = $db->prepare($sql);
$stmt->bindParam(':id', $transaction_id);
$stmt->execute();
$results = $stmt->fetchAll();

if (count($results) <= 0) {
    header('Location: ../transaction.php?type=error&message=You Have No Transaction Yet!');
    exit();
}

$sql = "SELECT * FROM expenditures WHERE transaction_id = :transaction_id AND item_id = :item_id";
$stmt = $db->prepare($sql);
$stmt->bindParam(':transaction_id', $transaction_id);
$stmt->bindParam(':item_id', $item_id);
$stmt->execute();
$results = $stmt->fetchAll();

if (count($results) > 0) {

    $existingQty = $results[0]['qty'];
    $newQty = $existingQty + $qty;

    $sql = "UPDATE expenditures SET qty = :new_qty WHERE transaction_id = :transaction_id AND item_id = :item_id";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':new_qty', $newQty);
    $stmt->bindParam(':transaction_id', $transaction_id);
    $stmt->bindParam(':item_id', $item_id);
    $stmt->execute();

    $sql = "SELECT * FROM items WHERE id = :item_id";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':item_id', $item_id);
    $stmt->execute();
    $results = $stmt->fetchAll();
    $stock = $results[0]['stock'];
    
    if ($stock < $qty){

        header('Location: ../transaction.php?type=error&message=Insufficient Stock!');
        exit();

    }else{

        $newStock = $stock - $qty;
        $sql = "UPDATE items SET stock = :new_stock WHERE id = :item_id";
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':new_stock', $newStock);
        $stmt->bindParam(':item_id', $item_id);
        $stmt->execute();
        generate_logs('Added item to transaction', 'Adding Expenditures');
        header('Location: ../transaction.php?type=success&message=Item Added Successfully!');
        exit();
    }
    
} else {

    $sql = "SELECT * FROM items WHERE id = :item_id";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':item_id', $item_id);
    $stmt->execute();
    $results = $stmt->fetchAll();
    $stock = $results[0]['stock'];
    if ($stock < $qty){
        header('Location: ../transaction.php?type=error&message=Insufficient Stock!');
        exit();
    }
    $newStock = $stock - $qty;

    $sql = "UPDATE items SET stock = :new_stock WHERE id = :item_id";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':new_stock', $newStock);
    $stmt->bindParam(':item_id', $item_id);
    $stmt->execute();

    $sql = "INSERT INTO expenditures (user_id, transaction_id, item_id, qty) VALUES (:user_id, :transaction_id, :item_id, :qty)";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':transaction_id', $transaction_id);
    $stmt->bindParam(':item_id', $item_id);
    $stmt->bindParam(':qty', $qty);
    $stmt->execute();
    generate_logs('Added item to order', 'Adding Expenditures');
    header('Location: ../transaction.php?type=success&message=Item Added Successfully!');
    exit();
}


header('Location: ../transaction.php?type=error&message=Something Went Wrong!');
