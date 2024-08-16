<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;

include_once 'connection.php';
if (session_status() === PHP_SESSION_NONE) {
        session_start();
}
if(isset($_POST['data_id'])){

        $id = $_POST['data_id'];

        $sql = "SELECT status,customer_id,type,kilo FROM laundry WHERE id = :id";
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

                require ("email/PHPMailer.php");
                require ("email/SMTP.php");
                require("email/Exception.php");

                $mail = new PHPMailer(true);

                $userID = $result['customer_id'];
                $userSql = "SELECT * FROM customers WHERE id = :id";
                $statement = $db->prepare($userSql);
                $statement->bindValue(':id', $userID);
                $statement->execute();
                $userResult = $statement->fetch();

                $itemID = $result['type'];
                $itemSql = "SELECT * FROM prices WHERE id = :id";
                $statement = $db->prepare($itemSql);
                $statement->bindValue(':id', $itemID);
                $statement->execute();
                $itemResult = $statement->fetch();

                $userEmail =  $userResult['email'];
                $userName = $userResult['fullname'];
                $userAddress = $userResult['address'];
                $laundry_item = $itemResult['name'];
                $date = date("Y-m-d", strtotime($date . '+ 3 days'));
                // date_add($date, date_interval_create_from_date_string("3 days"));
                // $estimated_date = date_format($date, "Y-m-d");

                try {
                $mail->isSMTP();                                            //Send using SMTP
                $mail->Host       = 'smtp.gmail.com';                     	//Set the SMTP server to send through
                $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                $mail->Username   = 'jainyashodip777@gmail.com';                //SMTP username
                $mail->Password   = 'pxzm uown mnvf qiqp';                             //SMTP password
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
                $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
                
                //Recipients
                $mail->setFrom('jainyashodip777@gmail.com', 'reply@dhobighat.com');
                $mail->addAddress($userEmail); 
                
                //Content
                $mail->isHTML(true);                                        //Set email format to HTML
                $mail->Subject = "Your Laundry is Ready!";
                $mail->Body    = "<div style='color: black;'>
                <p style='font-size: 14px;'><b>Dear Customer,</b><br><br>
                Your laundry is ready to be delivered, either you can collect your laundry on nearby 
                location or laundry will be delivered to your address before estimated date mention below.</p><br>
                <p><b>Name: </b>$userName</p>
                <p><b>Address: </b>$userAddress</p>
                <p><b>Email: </b>$userEmail</p>
                <p><b>Laundry Item: </b>{$result['kilo']}, $laundry_item</p>
                <p><b>Estimated Date: </b>$date</p><br><br>
                <p style='font-size: 14px; font-weight: bold;'>                
                Regards,<br>
                DhobiGhat, Nashik
                </p>
                <br><br>
                <p style='font-size: 10px; text-align:center;'>if any query contact us +91 9511757691</p>
                </div>";

                $mail->send();

                } catch (Exception $e) {
                        echo "Email could not be sent. Mailer Error: {$mail->ErrorInfo}";
                        header('Location: ../queue.php?type=error&message=Email could not be sent.');
                }

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

        generate_logs('Update Transaction', 'Transaction was updated to ' . $status . ' by ' . $_SESSION['username'] . '.');
        header('Location: ../queue.php?type=success&message=Laundry Status Updated Successfully!');
}
exit();
