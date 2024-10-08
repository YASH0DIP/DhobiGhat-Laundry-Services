<?php
include_once 'connection.php';
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$sql = "SELECT * FROM transactions WHERE user_id = :user_id AND status = 0 ORDER BY id DESC LIMIT 1";
$stmt = $db->prepare($sql);
$stmt->bindParam(':user_id', $_SESSION['id']);
$stmt->execute();
$results = $stmt->fetchAll();

$transaction_id = $results[0]['id'];

if (count($results) == 0){
    header('location: ../transaction.php?type=error&message=No Order Found!');
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
        WHERE expenditures.transaction_id = :transaction_id AND user_id = :user_id";
$stmt = $db->prepare($sql);
$stmt->bindParam(':transaction_id', $transaction_id);
$stmt->bindParam(':user_id', $_SESSION['id']);
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
        WHERE t.user_id = :user_id AND t.status = "pending"';
$stmt = $db->prepare($sql);
$stmt->bindParam(':user_id', $_SESSION['id']);
$stmt->execute();
$results = $stmt->fetchAll();

$total_price = 0;
foreach ($results as $row) {
    $total_price += $row['price'] * $row['kilo'];
}

$total_price = $total_price + $total_price*0.18;

$sql = "SELECT customer_id FROM transactions where id = $transaction_id";
$stmt = $db->prepare($sql);
$stmt->execute();
$results = $stmt->fetch();
$customer_id = $results['customer_id'];

echo $total_price;
$amount = $_POST['amount'];
// $comments = $_POST['comments'];
$sql = "UPDATE laundry SET customer_id = $customer_id  WHERE transaction_id = :id AND status = 0";
$stmt = $db->prepare($sql);
$stmt->bindParam(':id', $transaction_id);
$stmt->execute();

$sql = "UPDATE transactions SET total = :total, amount = :amount, status = 'completed' WHERE id = :id AND status = 'pending'";
$stmt = $db->prepare($sql);
$stmt->bindParam(':total', $total_price);
$stmt->bindParam(':id', $transaction_id);
$stmt->bindParam(':amount', $amount);
$stmt->execute();

generate_logs('New Pending Order', $_SESSION['username'].' added a new pending order');
header('location: ../reciept.php?id='.$transaction_id);