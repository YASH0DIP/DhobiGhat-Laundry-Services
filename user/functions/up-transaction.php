<?php
include_once 'connection.php';
if (session_status() === PHP_SESSION_NONE) {
        session_start();
}
$id = $_POST['data_id'];

$sql = "SELECT status FROM laundry WHERE id = :id";
$statement = $db->prepare($sql);
$statement->bindValue(':id', $id);
$statement->execute();
$result = $statement->fetch();
// if($result['status'] == 0){
//     header('Location: ../queue.php?type=error&message=Transaction is pending and cannot be updated.');
//     exit();
// }
if ($result['status'] == 0) {
        $status = 'Pending';
        $dateField = 'date0';
} else if ($result['status'] == 1) {
        $status = 'Washing';
        $dateField = 'date1';
} else if ($result['status'] == 2) {
        $status = 'Folding';
        $dateField = 'date2';
} else if ($result['status'] == 3) {
        $status = 'Ready for Pickup';
        $dateField = 'date3';
} else if ($result['status'] == 4) {
        $status = 'Order Claimed';
        $dateField = 'date4';
}

$sql = "UPDATE laundry SET
    status = status + 1,
    $dateField = NOW()
    WHERE id = :id";
$statement = $db->prepare($sql);
$statement->bindValue(':id', $id);
$statement->execute();

generate_logs('Update Transaction', $id . '| Transaction was updated to ' . $status . ' by ' . $_SESSION['username'] . '.');
header('Location: ../queue.php?type=success&message=Transaction Updated Successfully!');
exit();
