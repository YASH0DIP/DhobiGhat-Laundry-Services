<?php

include_once 'functions/authentication.php';
include_once 'functions/connection.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
$id = $_GET['id'];
$get_tracking_url = getHostByName(getHostName()) . dirname($_SERVER['PHP_SELF']) . '/tracking.php?id=' . $id;

function getLaundryReciept(){
    global $db;
    global $id;

    $customer_id = $_SESSION['id'];
    $customer_sql = "SELECT * FROM customers where id = $customer_id";
    $stmt = $db->prepare($customer_sql);
    $stmt->execute();
    $customer_results = $stmt->fetch();
    $userEmail = $customer_results['email'];

    require ("email/PHPMailer.php");
    require ("email/SMTP.php");
    require("email/Exception.php");
    
    $mail = new PHPMailer(true);
    
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
                    $mail->Subject = "Your Payment is Verified!";
                    $mail->Body =  "<div style='color: black;'>
                    <p style='font-size: 14px;'><b>Dear Customer,</b><br><br>
                    Your laundry order is placed, be ready with laundry our staff will come to get your laundry in next 30 min.</p><br>
                    <br>               
                    Regards,<br>
                    Team DhobiGhat
                    </p>
                    <br><br>
                    <p style='font-size: 10px; text-align:center;'>if any query contact us +91 9511757691</p>
                    </div>";
                
                    $mail->send();
                
                
                    } catch (Exception $e) {
                        echo "Email could not be sent. Mailer Error: {$mail->ErrorInfo}";
                        //header('Location: ../queue.php?type=error&message=Email could not be sent.');
                    }

    $sql = "SELECT t.id, t.customer_id, t.user_id, t.total, l.kilo, p.price, p.name, c.fullname, p.unit
        FROM transactions AS t
        JOIN laundry AS l ON t.id = l.transaction_id 
        JOIN prices AS p ON l.type = p.id
        JOIN users AS u ON t.user_id = u.id
        JOIN customers AS c ON t.customer_id = c.id
        WHERE t.id = :id";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach($result as $row){
        ?>
        <tr class="font-monospace">
                    <td class="font-monospace text-start mt-0 mb-0" style="font-size: 10px;"><?= $row['name']?></td>
                    <th class="font-monospace text-center mt-0 mb-0" style="font-size: 10px;"><?= $row['kilo'].' '.$row['unit']?></th>
                    <th class="font-monospace text-center mt-0 mb-0" style="font-size: 10px;">₹<?= number_format($row['price'], 2)?></th>
                    <td class="font-monospace text-end mt-0 mb-0" style="font-size: 10px;">₹<?= number_format($row['total'], 2)?></td>
                </tr>
        <?php
    }
}

function getItemsReciept(){
    global $db;
    global $id;
    $sql = "SELECT e.qty, e.item_id, i.name, i.unit
        FROM items AS i
        JOIN expenditures AS e ON i.id = e.item_id
        WHERE e.transaction_id = :id";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach($result as $row){
        ?>
        <tr class="font-monospace">
                    <td class="font-monospace text-start mt-0 mb-0" style="font-size: 10px;"><?= $row['name']?></td>
                    <th class="font-monospace text-center mt-0 mb-0" style="font-size: 10px;"><?= $row['unit']?></th>
                    <td class="font-monospace text-end mt-0 mb-0" style="font-size: 10px;"><?= $row['qty']?></td>
                </tr>
        <?php
    }
}

$sql = "SELECT t.id, t.total, l.kilo, p.price, t.amount, c.fullname
FROM transactions AS t
JOIN laundry AS l ON t.id = l.transaction_id 
JOIN prices AS p ON l.type = p.id
JOIN customers AS c ON t.customer_id = c.id
WHERE t.id = :id";
$stmt = $db->prepare($sql);
$stmt->bindParam(':id', $id);
$stmt->execute();
$result = $stmt->fetchAll();

$total = 0;
$customer = '';

foreach($result as $row){
    $total += $row['price'] * $row['kilo'];
    $customer = $row['fullname'];
    $amount = $row['amount'];
}


?>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>DHOBIGHAT Laundry Services</title>
    <link rel="shortcut icon" href="assets/img/washing-clothes.gif" type="image/gif">
    <meta name="description" content="LMS - Laundry Management System">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="assets/css/bs-theme-overrides.css">
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="assets/css/Pricing-Centered-badges.css">
    <script src="assets/js/qrious.min.js"></script>
</head>

<body class="mx-5" onload="<?php if (!isset($_GET['type'])){echo 'printPageAndRedirect()';}?>">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th class="font-monospace text-center" style="color: var(--bs-gray-900);font-size: 13px;">
                    <img src="assets/img/washing-clothes.gif" width="40">&nbsp;DHOBIGHAT<br>
                    <span style="font-weight: normal !important;">DHOBIGHAT Laundry Services</span><br>
                    <span style="font-weight: normal !important;">Phone (+91) 9511757691</span><br>
                    <span style="font-weight: normal !important;">Date: <?php echo date('Y-m-d')?></span><br>
                    <canvas class="mt-1 mb-2 text-center" id="qr-code"></canvas>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr></tr>
                <tr></tr>
            </tbody>
        </table>
    </div>
    <div class="table-responsive">
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th class="font-monospace text-center" style="font-size: 15px;">Laundry Reciept</th>
                </tr>
            </thead>
            <tbody class="font-monospace">
                <tr class="font-monospace"></tr>
                <tr class="font-monospace"></tr>
            </tbody>
        </table>
    </div>
    <div class="table-responsive font-monospace">
        <table class="table table-borderless">
            <thead class="font-monospace">
                <tr class="font-monospace">
                    <th class="font-monospace" style="font-size: 15px;"><span style="font-weight: normal !important;">CUSTOMER: <strong><?php echo $customer; ?></strong></span></th>
                    <th class="font-monospace text-end" style="font-size: 15px;"></th>
                    <th class="font-monospace text-end" style="font-size: 15px;"></th>
                    <th class="font-monospace text-end" style="font-size: 15px;">INVOICE #<?php echo $_GET['id'] ?></th>
                </tr>
            </thead>
            <tbody class="font-monospace">
                
            </tbody>
        </table>
    </div>
    <div class="table-responsive font-monospace">
        <table class="table table-borderless">
            <thead class="font-monospace">
                <tr class="font-monospace">
                    <th class="font-monospace text-center" style="font-size: 15px;"><span style="font-weight: normal !important;">LAUNDRY</span></th>
                </tr>
            </thead>
            <tbody class="font-monospace">
                
            </tbody>
        </table>
    </div>
    <div class="table-responsive font-monospace">
        <table class="table table-borderless">
            <thead class="font-monospace">
                <tr class="font-monospace">
                    <th class="font-monospace text-start" style="font-size: 12px;"><span><strong>LAUNDRY</strong></span></th>
                    <th class="font-monospace text-center" style="font-size: 12px;"><span><strong></strong></span></th>
                    <th class="font-monospace text-center" style="font-size: 12px;"><span><strong>PRICE</strong></span></th>
                    <th class="font-monospace text-end" style="font-size: 12px;"><span><strong>TOTAL</strong></span></th>
                </tr>
            </thead>
            <tbody class="font-monospace">
                <?php getLaundryReciept()?>
            </tbody>
        </table>
    </div>
    <div class="table-responsive font-monospace">
        <table class="table table-borderless">
            <thead class="font-monospace">
                <tr class="font-monospace">
                    <th class="font-monospace text-center" style="font-size: 15px;"><span style="font-weight: normal !important;">ITEMS</span></th>
                </tr>
            </thead>
            <tbody class="font-monospace">
               
            </tbody>
        </table>
    </div>
    <div class="table-responsive font-monospace">
        <table class="table table-borderless">
            <thead class="font-monospace">
                <tr class="font-monospace">
                    <th class="font-monospace text-start" style="font-size: 12px;"><span><strong>ITEM</strong></span></th>
                    <th class="font-monospace text-center" style="font-size: 12px;"><span><strong>UNIT</strong></span></th>
                    <th class="font-monospace text-end" style="font-size: 12px;"><span><strong>QTY</strong></span></th>
                </tr>
            </thead>
            <tbody class="font-monospace">
                <?php getItemsReciept() ?>
            </tbody>
        </table>
    </div>
    <div class="table-responsive">
        <table class="table">
            <thead class="font-monospace">
                <tr class="font-monospace">
                    <th class="font-monospace text-end"><strong>TOTAL</strong>&nbsp;<strong>₹<?php echo number_format($total, 2); ?></strong></th>
                </tr>
                <tr class="font-monospace">
                    <th class="font-monospace text-end"><strong>CHARGES</strong>&nbsp;<strong>₹<?php echo number_format($total*0.18, 2); ?></strong></th>
                </tr>
                <tr class="font-monospace">
                    <th class="font-monospace text-end"><strong>FINAL AMOUNT</strong>&nbsp;<strong>₹<?php echo number_format($total+$total*0.18, 2); ?></strong></th>
                </tr>
            </thead>
            <tbody>
                <tr></tr>
            </tbody>
        </table>
        <table class="table table-borderless">
                <thead class="font-monospace">
                    <tr class="font-monospace">
                        <th class="font-monospace text-center"><strong class="text-danger">**** PLEASE BRING THE RECIEPT TO CLAIM YOUR LAUNDRY ****</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <tr></tr>
                </tbody>
            </table>
        </div>
    <!-- BASKET QRCODE -->
    
    <div class="table-responsive mt-5">
        <table class="table">
            <thead>
                <tr>
                    <th class="font-monospace text-center" style="color: var(--bs-gray-900);font-size: 13px;">
                        <img src="assets/img/washing-clothes.gif" width="40">&nbsp;DHOBIGHAT<br>
                        <span style="font-weight: normal !important;">DHOBIGHAT Laundry Services</span><br>
                        <span style="font-weight: normal !important;">Phone (+91) 9511757691</span><br>
                        <span style="font-weight: normal !important;">Date: <?php echo date('Y-m-d')?></span><br>
                        <canvas class="mt-1 mb-2 text-center w-50" id="qr-code-basket"></canvas>
                        <h1 class="display-1">BASKET QRCODE</h1>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr></tr>
                <tr></tr>
            </tbody>
        </table>
    </div>
    
    <!-- END BASKET QRCODE -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap5.min.js"></script>
    <script src="assets/js/dataTables.buttons.min.js"></script>
    <script src="assets/js/jszip.min.js"></script>
    <script src="assets/js/pdfmake.min.js"></script>
    <script src="assets/js/vfs_fonts.js"></script>
    <script src="assets/js/buttons.html5.min.js"></script>
    <script src="assets/js/buttons.print.min.js"></script>
    <script src="assets/js/listTable.js"></script>
    <script src="assets/js/theme.js"></script>
    <script>
        $(document) .ready(function() {
            (function() {
                var qr = new QRious({
                        element: document.getElementById('qr-code'),
                        size: 150,
                        value: '<?php echo $get_tracking_url; ?>'
                    });
                var qr = new QRious({
                        element: document.getElementById('qr-code-basket'),
                        size: 350,
                        value: '<?php echo $get_tracking_url; ?>'
                    });
                })();
            
            // $('.qr-code').each(function() {
            //     var qr = new QRious({
            //         element: this,
            //         size: 150,
            //         value: '<?php echo $get_tracking_url; ?>'
            //     });
            // });
        } );
            function printPageAndRedirect() {
                setTimeout(function() {
                    window.setTimeout(function() {
                        window.print();
                        window.location.href = 'transaction.php';
                    }, 500);
                }, 500);
            }
            
    </script>
</body>

</html>