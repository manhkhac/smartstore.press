<?php 
    session_start(); 

    $filepath = realpath(dirname(__FILE__));
    include_once ($filepath.'/../classes/cart.php');
    include_once ($filepath.'/../helpers/format.php');
    include_once ($filepath.'/../classes/customer.php');
 ?>

<link rel="stylesheet" href="css/inhd.css">
<body onload="window.print()" cz-shortcut-listen="true">
<div id="page" class="page">
    <div class="header">
        <div class="logo"><img src="../../web_mvc/images/logo.png " width="230px" height="100px" /></div>
        <!-- <div class="company">C.Ty TNHH 1 Thành Viên</div> -->
    </div>
    <tr>
        <td height="25" valign="top"align="center"><div align="left">
          <table width="100%">
            <tbody>
              <tr>
                <td width="5" height="95">&nbsp;</td>
             
                <td width="343"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                      <tr>
                        <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                              <tr>
                                <td colspan="2"><strong>CỬA HÀNG ĐIỆN THOẠI MANH NGUYEN</strong></td>
                              </tr>
                              <tr>
                                <td>Địa chỉ</td>
                                <td>: 467 Lĩnh Nam - Hoàng Mai - Thành Phố Hà Nội</td>
                              </tr>
                              <tr>
                              </tr>
                              <tr>
                                <td>Di Động </td>
                                <td>: 086 598 3826</td>
                              </tr>
                              <tr>
                                <td>Email</td>
                                <td>: Khacmanh.info@gmail.com</td>
                              </tr>
                            </tbody>
                        </table></td>
                      </tr>
                    </tbody>
                </table></td>
              </tr>
            </tbody>
          </table>
        </div></td>
      </tr>
  <div class="title">
         <td width="562" height="25" valign="top"align="center">  <hr>
                    <strong><font color="#FF0000" size="+2">HÓA ĐƠN XUẤT HÀNG</font></strong></td>
        <br/>
        -------oOo-------
<?php
    $cs = new customer(); 
    if(!isset($_GET['customerid']) || $_GET['customerid'] == NULL){
        
    }else {
        $id = $_GET['customerid']; // Lấy catid trên host
    }
    
    
    
  ?>
        <div class="grid_10">
            <div class="box round first grid">
                      
               <div class="block copyblock"> 
                 <?php 
                    $get_customer = $cs->show_customers($id);
                    if($get_customer){
                        while ($result = $get_customer->fetch_assoc()) {
 
                  ?>
                  <p style="text-align: left; font-size: 16px;">THÔNG TIN KHÁCH HÀNG</p>
                 <form action="" method="post">
                    <table class="form">          
                        <tr>
                            <td>Tên khách hàng</td>
                            <td>: </td>
                            <td>
                                <?php echo $result['name']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Số điện thoại</td>
                            <td>: </td>
                            <td>
                               <?php echo $result['phone']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Thành phố</td>
                            <td>: </td>
                            <td>
                               <?php echo $result['city']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Quốc gia</td>
                            <td>: </td>
                            <td>
                                <?php echo $result['country']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Địa chỉ</td>
                            <td>: </td>
                            <td>
                                <?php echo $result['address']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Zipcode</td>
                            <td>: </td>
                            <td>
                                <?php echo $result['zipcode']; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>: </td>
                            <td>
                                <?php echo $result['email']; ?>
                            </td>
                        </tr>
                        
            
                    </table>
                    </form>

                    <?php 
                        }
                    }

                     ?>

                </div>
            </div>
        </div>
  </div>
  
  <table class="TableData">
    <tr>
      <th>STT</th>
      <th>Tên sản phẩm</th>
      <th>Đơn giá</th>
      <th>Số lượng</th>
      <th>Thành tiền</th>
    </tr>
    <?php

            $ct = new cart();
            $fm = new Format();
             if(!isset($_GET['customerid']) || $_GET['customerid'] == NULL){
        
                }else {
                    $customer_id = $_GET['customerid']; // Lấy catid trên host
                }
            $get_cart_ordered = $ct -> get_cart_ordered($customer_id);

            $tongsotien= 0;
            if ($get_cart_ordered) {
              $i=0;
            
              while ($result = $get_cart_ordered->fetch_assoc()) {
                $i++;
                $thanhtien= $result['price']*$result['quantity'];
                $tongsotien+=$thanhtien;
             ?>
            <tr class="odd gradeX">
                <td><?php echo $i; ?></td>
                <td><?php echo $result['productName'] ?> </td>
                <td><?php echo number_format( $result['price'],"0",",",".")?> VNĐ</td>
                 <td><?php echo $result['quantity'] ?></td>
                <td><?php echo number_format(($thanhtien),"0",",",".")?> VNĐ</td>
            </tr>
            <?php 
            }
         }
      ?>
    <tr>
      <td colspan="4" class="tong">Tổng cộng</td>
      <td class="cotSo"><?php echo number_format(($tongsotien),0,",",".")?> VNĐ</td>
    </tr>
  </table>


  <div class="footer-left"> <br/>
    Khách hàng <br>
    
  </div>
  <div class="footer-right"> Ngày <?php echo date("d/m/Y");?><br/><br/>
    Nhân viên <br/>
   <strong> ManhST</strong></div>


       

</div>
</body>