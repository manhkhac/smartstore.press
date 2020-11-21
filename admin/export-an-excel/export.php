<?php include_once('config.php'); include('Classes/PHPExcel.php');

$objPHPExcel	=	new	PHPExcel();
$result			=	$db->query("SELECT * FROM tbl_order") or die(mysql_error());

$objPHPExcel->setActiveSheetIndex(0);

$objPHPExcel->getActiveSheet()->SetCellValue('A1', 'STT');
$objPHPExcel->getActiveSheet()->SetCellValue('B1', 'Ngày đặt');
$objPHPExcel->getActiveSheet()->SetCellValue('C1', 'Tên khách hàng');
$objPHPExcel->getActiveSheet()->SetCellValue('D1', 'Số điện thoại');
$objPHPExcel->getActiveSheet()->SetCellValue('E1', 'Tên sản phẩm');
$objPHPExcel->getActiveSheet()->SetCellValue('F1', 'Số lượng');
$objPHPExcel->getActiveSheet()->SetCellValue('G1', 'Giá');
$objPHPExcel->getActiveSheet()->SetCellValue('H1', 'Xử lý');

$objPHPExcel->getActiveSheet()->getColumnDimension("B")->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension("C")->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension("D")->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension("E")->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension("F")->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension("G")->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension("H")->setAutoSize(true);

$objPHPExcel->getActiveSheet()->getStyle("A1:H1")->getFont()->setBold(true);

$objPHPExcel->getActiveSheet()->getStyle('A1:H1')->getFill()->applyFromArray(
            array('type'       => PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR,'rotation'   => 0, 'startcolor' => array('rgb' => 'FFFF00'),'endcolor'   => array('argb' => '00ffff00')));


$objPHPExcel->getActiveSheet()->getStyle("A1:G1")->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$stt=0;
$rowCount	=	2;
//$tong =0;

while($row	=	$result->fetch_assoc()){
	$stt +=1;
	$idnd = $row['customer_id'];
	$nd = $db->query("SELECT * FROM tbl_customer WHERE id = $idnd" ) or die(mysql_error());
	while($row1	=	$nd->fetch_assoc()){
			$name = $row1['name'];
			$sdt = $row1['phone'];
		}
	//$tien = $row['quantity'] * $row['price'];
	$gia = $row['price']*$row['quantity'];
	//$tong += $tien;	

		if($row['status']==0){
			$xuly =  'Đang chờ xử lý...'; 
		}elseif($row['status']==1) {
			$xuly = 'Đang giao hàng...';
		}elseif($row['status']==2) {
			$xuly = 'Đã giao hàng';
		}


	$objPHPExcel->getActiveSheet()->SetCellValue('A'.$rowCount,$stt);
	$objPHPExcel->getActiveSheet()->SetCellValue('B'.$rowCount, mb_strtoupper($row['date_order'],'UTF-8'));
	$objPHPExcel->getActiveSheet()->SetCellValue('C'.$rowCount, mb_strtoupper($name,'UTF-8'));
	$objPHPExcel->getActiveSheet()->SetCellValue('D'.$rowCount, mb_strtoupper($sdt,'UTF-8'));
	$objPHPExcel->getActiveSheet()->SetCellValue('E'.$rowCount, mb_strtoupper($row['productName'],'UTF-8'));
	$objPHPExcel->getActiveSheet()->SetCellValue('F'.$rowCount, mb_strtoupper($row['quantity'],'UTF-8'));
	$objPHPExcel->getActiveSheet()->SetCellValue('G'.$rowCount, mb_strtoupper($gia,'UTF-8'));
	$objPHPExcel->getActiveSheet()->SetCellValue('H'.$rowCount, mb_strtoupper($xuly,'UTF-8'));
	
	
	//$objPHPExcel->getActiveSheet()->SetCellValue(''.$rowCount, $tong);
	$rowCount++;
}

$sum = "=SUM(G2:G$rowCount)";
$objPHPExcel->getActiveSheet()->SetCellValue('G'.($rowCount+1),$sum);
$objPHPExcel->getActiveSheet()->SetCellValue('F'.($rowCount+1),'Tổng Tiền:');
$objPHPExcel->getActiveSheet()->getStyle('F'.($rowCount+1))->getFont()->setBold(true);


$styleArray=array(
				'borders'=> array(
                 'allborders' => array(
                  	'style' => PHPExcel_Style_Border::BORDER_THIN
                 )
            )
      );
$objPHPExcel->getActiveSheet()->getStyle('A1:' .'H'.($rowCount+1))->applyFromArray($styleArray);


$objWriter	=	new PHPExcel_Writer_Excel2007($objPHPExcel);


header('Content-Type: application/vnd.ms-excel'); //mime type
header('Content-Disposition: attachment;filename="xuathoadon.xlsx"'); //tell browser what's the file name
header('Cache-Control: max-age=0'); //no cache
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');  
$objWriter->save('php://output');
?>
