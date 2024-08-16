<?php
/*
include_once 'connection.php';

// Get the form data
$fullname = $_POST['fullname'];
$address = $_POST['address'];
$mobile = $_POST['mobile'];
$username = $_POST['username'];
$password = $_POST['password'];
$cpassword = $_POST['cpassword'];

// Check if the user exists
$sql = "INSERT INTO customers(fullname,address,contact,username,password) VALUES('$fullname','$address','$mobile','$username','$password')";
$stmt = $db->prepare($sql);
$stmt->execute([$username]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user && password_verify($password, $user['password'])) {

    session_start();
    $_SESSION['username'] = $username;
    $_SESSION['level'] = $user['level'];
    $_SESSION['id'] = $user['id'];
    if (isset($_POST['remember'])) {
        setcookie('username', $username, time() + (86400 * 30), "/");
        setcookie('password', $password, time() + (86400 * 30), "/");
    } else {
        setcookie('username', '', time() - 3600, "/");
        setcookie('password', '', time() - 3600, "/");
    }
    generate_logs('Login', $username.'| Logged in');
    header('location: ../index.php');
} else {
    // Show an error message
    header('location: ../login.php?type=error&message=Wrong username or password');
}
*/
include_once 'connection.php';

$fullname = $_POST['fullname'];
$address = $_POST['address'];
$contact = $_POST['mobile'];
$email = $_POST['email'];
$username = $_POST['username'];
$password = $_POST['password'];
$cpassword = $_POST['cpassword'];

$sql = "SELECT * FROM customers WHERE fullname = :fullname OR contact = :contact";
$stmt = $db->prepare($sql);
$stmt->bindParam(':fullname', $fullname);
$stmt->bindParam(':contact', $contact);
$stmt->execute();

if ($stmt->rowCount() > 0) {
    header('Location: ../login.php?type=error&message='.$fullname.' is already exist or contact number is already exist');
    exit;
}

if ($cpassword!=$password) {
    header('Location: ../login.php?type=error&message= password and conform password should be same');
    exit;
}

$password = password_hash($password, PASSWORD_DEFAULT);

// $sql = "INSERT INTO customers (fullname, address, contact,) VALUES (:fullname, :address, :contact)";
$sql = "INSERT INTO customers (fullname,address,contact,email,username,password) VALUES (:fullname,:address,:contact,:email,:username,:password)";
$stmt = $db->prepare($sql);
$stmt->bindParam(':fullname', $fullname);
$stmt->bindParam(':address', $address);
$stmt->bindParam(':contact', $contact);
$stmt->bindParam(':email', $email);
$stmt->bindParam(':username', $username);
$stmt->bindParam(':password', $password);
$stmt->execute();

generate_logs('Adding Customer', $fullname.'| New Customer was added');
header('Location: ../login.php?type=success&message=New Customer Registered Successfully');