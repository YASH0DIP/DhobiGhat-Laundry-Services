<?php
include_once 'connection.php';

$fullname = $_POST['firstname'] . ' ' . $_POST['lastname'];
//$fullname = strtoupper($fullname);

$address = $_POST['address'];
$contact = $_POST['contact'];
$email = $_POST['email'];
$username = $_POST['username'];
$password = $_POST['password'];
$password = password_hash($password, PASSWORD_DEFAULT);

$sql = "SELECT * FROM customers WHERE fullname = :fullname OR contact = :contact";
$stmt = $db->prepare($sql);
$stmt->bindParam(':fullname', $fullname);
$stmt->bindParam(':contact', $contact);
$stmt->execute();

if ($stmt->rowCount() > 0) {
    header('Location: ../customer.php?type=error&message='.$fullname.' is Already Exist or Contact Number is Already Exist');
    exit;
}

$sql = "INSERT INTO customers (fullname, address, contact, email, username, password) VALUES (:fullname, :address, :contact, :email, :username, :password)";
$stmt = $db->prepare($sql);
$stmt->bindParam(':fullname', $fullname);
$stmt->bindParam(':address', $address);
$stmt->bindParam(':contact', $contact);
$stmt->bindParam(':email', $email);
$stmt->bindParam(':username', $username);
$stmt->bindParam(':password', $password);
$stmt->execute();

generate_logs('Adding Customer', $fullname.'| New Customer was added');
header('Location: ../customer.php?type=success&message=New Customer Added Successfully');
?>