<?php 
	include 'inc/header.php';
	// include 'inc/slider.php';
 ?>
<?php
     
    if(!isset($_GET['catid']) || $_GET['catid'] == NULL){

        echo "<script> 
        				alert('Chuẩn bị tài khoản ngân hàng chưa mà kích vào đây, mua offlinepayment tạm đi nhé, thời gian đâu mà làm bạn ơi!');
        				window.location = 'payment.php';
        	 </script>";
        
    }else {
        $id = $_GET['catid']; // Lấy catid trên host
    }