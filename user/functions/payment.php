<?php
// Retrieve data sent from transaction.php
$kilo = $_POST['kilo'];
$type = $_POST['type'];
$amount = $_POST['amount'];
$id = $_POST['id'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DHOBIGHAT PAYMENT GATEWAY</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style type="text/css">
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: "Jost", sans-serif; }
        body { background: #efefef; display: flex; align-items: center; justify-content: center; height: 100vh; width: 100%; }
        section { max-width: 95%; max-height: 90vh; width: 600px; background: #fff; padding: 40px; overflow-y: auto; border-top: 10px solid #0989ff; }
        .flex { display: flex; flex-direction: column; }
        .flex input { border: none; outline: none; padding: 0px 20px; height: 50px; width: 100%; border: 1px solid #e8e8e8; }
        .m10 { margin-top: 10px; }
        .m20 { margin-top: 20px; }
        button { width: 200px; border: none; outline: none; cursor: pointer; height: 50px; background: #0989ff; color: #fff; padding: 0px 20px; }
        input:focus { border: 1px solid #0989ff; }
        button:hover { background: #0870d0; }
        .get_qr { height: 200px; width: 200px; border: 1px solid #999; background: #efefef; }
        .qr_code { width: 100%; height: 100%; display: none; }
        p { color: #7a7a7a; font-size: 16px; line-height: 24px; }
        .im { max-width: 100%; width: 300px; }
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".generate_qr").click(function() {
                var name = $(".name").val().trim();
                var num = $(".number").val().trim();
                var email = $(".email").val().trim();
                if (name === "" || num === "" || email === "") {
                    alert("Fill all fields correctly");
                    return;
                }

                $(".form").hide();
                $(".qr_code").show();

                //var link = "upi://pay?pa=9511757691%40ybl&pn=Foody&tn=Order&am=100.34&cu=INR";
                var link = "upi://pay?pa=9511757691@ybl&pn="+name+"&am="+<?php echo $amount; ?>+"&cu=INR&tn=laundryPayment";
                //var upi = "https://chart.googleapis.com/chart?chs=200x200&cht=qr&chl=" + encodeURIComponent(link);
                var upi = "https://qrcode.tec-it.com/API/QRCode?data="+encodeURIComponent(link);
                console.log(upi);
                $(".get_qr").attr("src", upi);
            });

            $(".download_now").click(function() {


                var payment_id = $(".id").val().trim();

                if (payment_id === null) {
                    alert("Fill all fields correctly");
                    return;
                }

                console.log(payment_id);

                $.ajax({
                    type: "POST",
                    url: "proceed-transaction.php",
                    data: {
                        kilo: "<?php echo $kilo; ?>",
                        type: "<?php echo $type; ?>",
                        amount: "<?php echo $amount; ?>",
                        id: "<?php echo $id; ?>",
                        payment_id: payment_id
                    },
                    success: function(response) {
                        
                        window.location.href = "proceed-transaction.php"; // Redirect to receipt page
                    }
                });
            });
        });
    </script>
</head>
<body>
    <section>
        <h1>DHOBIGHAT PAYMENT GATEWAY</h1>
        <div class="form">
            <div class="flex m20">
                <label>Full Name*</label>
                <input type="text" name="name" placeholder="Full Name" class="m10 name">
            </div>
            <div class="flex m20">
                <label>Mobile Number</label>
                <input type="text" name="phone" placeholder="1234567890" class="m10 number">
            </div>
            <div class="flex m20">
                <label>Email*</label>
                <input type="email" name="email" placeholder="Email" class="m10 email">
            </div>
            <div class="flex m20">
                <button class="generate_qr">NEXT</button>
            </div>
        </div>
        <div class="qr_code m20">
            <p>Scan the QR Code with any UPI App and pay the amount then enter the transaction id.</p>
            <center><img src="" alt="QR CODE" class="get_qr m10"></center>
            <center><img src="1.png" class="im m10"></center>
            <div class="flex m20">
                <label>UTR/REFERENCE/TRANSACTION ID</label>
                <input type="text" name="" placeholder="UTR/REFERENCE/TRANSACTION ID**" class="m10 id">
            </div>
            <center><button class="download_now m20">GENERATE INVOICE</button></center>
        </div>
    </section>
    <!-- <? isset($_POST['transaction_id']) ? $_SESSION['upi_transaction_id'] = $_POST['transaction_id'] : $_SESSION['upi_transaction_id'] = "1234567890"; ?> -->
</body>
</html>
