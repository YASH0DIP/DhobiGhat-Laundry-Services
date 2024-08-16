<?php
include_once 'setup.php';

if (!$db) {
    die("Connection failed: " . $db->connect_error);
}

function generate_logs($type, $logs)
{
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
    global $db;
    $sql = "INSERT INTO logs (user_id, logs, type) VALUES (1, '$logs', '$type')";
    $stmt = $db->prepare($sql);
    // $stmt->bindParam(':user_id', $id);
    // $stmt->bindParam(':logs', $logs);
    // $stmt->bindParam(':type', $type);
    $stmt->execute();
}
