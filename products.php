<?php 
	include 'inc/header.php';
	include 'inc/slider.php';
	   $brand = new brand();
 ?>

 <div class="main">
 	<div class="content">
 		<?php $show_brand = $brand->show_brand();
	      	if($show_brand){
	      		while ($result = $show_brand->fetch_assoc()) {
	      		 ?>
	     <!-- TD -->
			<div class="content_top">
    		<div class="heading">
    		<h3><?php echo $result['brandName'] ?></h3>
    		</div>
    		<div class="clear"></div>
    	</div>
    	<!-- END TD -->
			<div class="section group">
			<?php 
	      	$product_new = $product->getproductbybrandId($result['brandId']);
	      	if($product_new){
	      		while ($result_new = $product_new->fetch_assoc()) {
	      			      	
	      	 ?>
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="details.php"><img src="admin/uploads/<?php echo $result_new['image'] ?>" alt="" /></a>
					 <h2><?php echo $result_new['productName'] ?></h2>
					 <p><?php echo $fm->textShorten($result_new['product_desc'], 50) ?></p>
					 <p><span class="price"><?php echo $fm->format_currency($result_new['price'])." VND" ?></span></p>
				     <div class="button"><span><a href="details.php?proid=<?php echo $result_new['productId'] ?>" class="details">Chi tiết</a></span></div>

				</div>
			<?php 
				}
				}
			?>
			</div>
			<?php } ?>
    </div>
	<?php } ?>
 </div>
<?php 
	include 'inc/footer.php';
 ?>

