<?php
include_once 'functions/connection.php';

function customer_list (){
    global $db;
    $sql = 'SELECT * FROM customers ORDER BY fullname ASC';
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();

    foreach ($results as $row) {
    $fullname = $row['fullname'];
    ?>
        <option value="<?php echo $row['id']; ?>"><?php echo $fullname; ?></option>
    <?php
    }
}

function give_customer($id){
    global $db;
    $sql = "SELECT * FROM customers where id = $id";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();

    foreach ($results as $row) {
    $fullname = $row['fullname'];
    ?>
        <option value="<?php echo $row['id']; ?>" selected><?php echo $fullname; ?></option>
    <?php
    }
}

function items_list (){
    global $db;
    $sql = 'SELECT * FROM items WHERE stock > 0 ORDER BY name ASC';
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();

    foreach ($results as $row) {
    $name = $row['name'];
    ?>
        <option value="<?php echo $row['id']; ?>"><?php echo $name; ?> | Qty: <?php echo $row['stock']; ?></option>
    <?php
    }
}


function price_list (){
    global $db;
    $sql = 'SELECT * FROM prices ORDER BY name ASC';
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    foreach ($results as $row) {
    $name = $row['name'];
    ?>
        
        <option value="<?php echo $row['id']; ?>" data-unit="<?php echo $row['unit']; ?>">₹<?php echo $row['price']; ?>&nbsp;|&nbsp;<?php echo $name; ?></option>
    <?php
    }
}

function get_transaction ($id){
    global $db;
    // Need to be fixed 7/15/2023
    $sql = 'SELECT t.id, c.fullname, c.address, c.contact
            FROM transactions AS t
            JOIN customers AS c ON t.customer_id = c.id
            WHERE t.status = "pending" AND t.customer_id = '.$id.';
            ';
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    return $results;
}