<?php
include_once 'functions/connection.php';

function get_monthly(){
    global $db;
    $sql = "SELECT SUM(total) AS total_earnings
            FROM transactions
            WHERE MONTH(created_at) = MONTH(CURRENT_TIMESTAMP)
            AND MONTH(created_at) = MONTH(CURRENT_TIMESTAMP)
            AND YEAR(created_at) = YEAR(CURRENT_TIMESTAMP)";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    foreach ($results as $row) {
        if ($row['total_earnings'] == null){
            echo "0";
        }
        else{
            echo number_format($row['total_earnings'],2);
        }
    }
}

function get_yearly(){
    global $db;
    $sql = "SELECT YEAR(CURRENT_TIMESTAMP) AS year,
            SUM(total) AS total_earnings
            FROM transactions
            WHERE YEAR(created_at) = YEAR(CURRENT_TIMESTAMP)
            GROUP BY YEAR(created_at) = YEAR(CURRENT_TIMESTAMP)";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    if ($results){
    foreach ($results as $row) {
            echo number_format($row['total_earnings'],2);
    }}
    else{
        echo "0";
    }
}


function get_pending($user_id){
    global $db;
    $current_month = date('m');
    $sql = "SELECT COUNT(*) AS total_pending
            FROM laundry
            WHERE status = 0 AND 
            customer_id = $user_id";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    foreach ($results as $row) {
        echo $row['total_pending'];
    }
}

function get_processing($user_id){
    global $db;
    $current_month = date('m');
    $sql = "SELECT COUNT(*) AS total_processing
            FROM laundry
            WHERE status = 1
            AND customer_id = $user_id";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
   if($results){
    foreach ($results as $row) {
        echo $row['total_processing'];
    }}
    else{
        echo "0";
    }
}

function get_folding($user_id){
    global $db;
    $current_month = date('m');
    $sql = "SELECT COUNT(*) AS total_folding
            FROM laundry
            WHERE status = 2
            AND customer_id = $user_id";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    if($results){
    foreach ($results as $row) {
        echo $row['total_folding'];
    }}
    else{
        echo "0";
    }
}

function get_ready($user_id){
    global $db;
    $current_month = date('m');
    $sql = "SELECT COUNT(*) AS total_ready
            FROM laundry
            WHERE status = 3
            AND customer_id = $user_id";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    if($results){
    foreach ($results as $row) {
        echo $row['total_ready'];
    }}
    else{
        echo "0";
    }
}

function get_claimed($user_id){
    global $db;
    $current_month = date('m');
    $sql = "SELECT COUNT(*) AS total_claimed
        FROM laundry
        WHERE status = 4
        AND customer_id = $user_id";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    if ($results){
    foreach ($results as $row) {
        echo $row['total_claimed'];
    }}
    else{
        echo "0";
    }
}

function get_customers(){
    global $db;
    $sql = "SELECT COUNT(*) AS total_customers
            FROM customers";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    if ($results){
    foreach ($results as $row) {
        echo $row['total_customers'];
    }}
    else{
        echo "0";
    }
}
