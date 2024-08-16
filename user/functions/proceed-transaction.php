<?php

include_once 'connection.php';
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$kilo = $_POST['kilo'];
$type = $_POST['type'];
$amount = $_POST['amount'];
$id = $_POST['id'];
$payment_id = $_POST['payment_id'] ?? "404";

$sql = "SELECT * FROM transactions WHERE customer_id = :user_id AND status = 0 ORDER BY id DESC LIMIT 1";
$stmt = $db->prepare($sql);
$stmt->bindParam(':user_id', $_SESSION['id']);
$stmt->execute();
$results = $stmt->fetchAll();

$transaction_id = $results[0]['id'];
// echo $transaction_id;

if (count($results) == 0){
    header('location: ../transaction.php?type=error&message=No Transaction Found!');
    exit();
}

$sql = "SELECT * FROM laundry WHERE transaction_id = :transaction_id AND status = 0";
$stmt = $db->prepare($sql);
$stmt->bindParam(':transaction_id', $transaction_id);
$stmt->execute();
$results = $stmt->fetchAll();

if (count($results) == 0){
    header('location: ../transaction.php?type=error&message=No Laundry Found!');
    exit();
}

$sql = "SELECT expenditures.id
        FROM expenditures
        JOIN items ON expenditures.item_id = items.id
        WHERE expenditures.transaction_id = :transaction_id";
$stmt = $db->prepare($sql);
$stmt->bindParam(':transaction_id', $transaction_id);
// $stmt->bindParam(':user_id', $_SESSION['id']);
$stmt->execute();
$results = $stmt->fetchAll();

if (count($results) == 0){
    header('location: ../transaction.php?type=error&message=No Items Found!');
    exit();
}

$sql = 'SELECT l.id, l.kilo, p.price AS price
        FROM laundry AS l
        JOIN transactions AS t ON l.transaction_id = t.id
        JOIN prices AS p ON l.type = p.id
        WHERE t.customer_id = :user_id AND t.status = "pending"';
$stmt = $db->prepare($sql);
$stmt->bindParam(':user_id', $_SESSION['id']);
$stmt->execute();
$results = $stmt->fetchAll();

$total_price = 0;
foreach ($results as $row) {
    $total_price += $row['price'] * $row['kilo'];
}

$total_price = $total_price + $total_price*0.18;

// echo $total_price;
$customer_id = $_SESSION['id'];
$amount = $_POST['amount'];

$sql = "UPDATE laundry SET customer_id = $customer_id WHERE transaction_id = :id AND status = 0";
$stmt = $db->prepare($sql);
$stmt->bindParam(':id', $transaction_id);
$stmt->execute();

$sql = "UPDATE transactions SET total = :total, amount = :amount, status = 'completed' WHERE id = :id AND status = 'pending'";
$stmt = $db->prepare($sql);
$stmt->bindParam(':total', $total_price);
$stmt->bindParam(':id', $transaction_id);
$stmt->bindParam(':amount', $amount);
$stmt->execute();

//if($payment_id!="404"){
$sql = "INSERT INTO payments(payment_id, invoice_id, amount) VALUES($payment_id, $transaction_id,$total_price)";
$stmt = $db->prepare($sql);
$stmt->execute();

$sql = "DELETE FROM payments WHERE amount = 0";
$statement = $db->prepare($sql);
//$statement->bindParam(':id', $transaction_id);
$statement->execute();
//}


generate_logs('New Pending Order', $_SESSION['username'].' added a new pending order');
// header('location: ./payment.php?type=success&message=Item was added successfully');
header('location: ../reciept.php?id='.$transaction_id);