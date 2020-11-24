<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="ftco-section" id="top_singleProduct">
	<div class="container">
		<div class="row">

			<div class="col-lg-6 mb-5 ftco-animate">
				<a
					href="<c:url value='retrieveImageServlet?id=${selectedProduct.productId}&type=PRODUCT' />"
					class="image-popup"><img
					src="<c:url value='retrieveImageServlet?id=${selectedProduct.productId}&type=PRODUCT' />"
					class="img-fluid" alt="Colorlib Template"></a>
			</div>
			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
				<h3>${selectedProduct.product}</h3>
				<div class="rating d-flex">
					<p class="text-left mr-4">
						<a href="#" class="mr-2">5.0</a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a>
					</p>
					<p class="text-left mr-4">
						<a href="#" class="mr-2" style="color: #000;">100 <span
							style="color: #bbb;">Rating</span></a>
					</p>
					<p class="text-left">
						<a href="#" class="mr-2" style="color: #000;">500 <span
							style="color: #bbb;">Sold</span></a>
					</p>
				</div>
				<p class="price">
					<span>${selectedProduct.price}元</span>
				</p>
				<p>${selectedProduct.description}</p>
				<div class="row mt-4">
					<div class="col-md-6">
						<div class="form-group d-flex">
							<div class="select-wrap">
								<div class="icon">
									<span class="ion-ios-arrow-down"></span>
								</div>
								<select name="" id="" class="form-control">
									<option value="">Small</option>
									<option value="">Medium</option>
									<option value="">Large</option>
									<option value="">Extra Large</option>
								</select>
							</div>
						</div>
					</div>
					<div class="w-100"></div>
					<div class="input-group col-md-6 d-flex mb-3">
						<span class="input-group-btn mr-2">
							<button type="button" class="quantity-left-minus btn"
								data-type="minus" data-field="">
								<i class="ion-ios-remove"></i>
							</button>
						</span> <input type="text" id="quantity" name="quantity"
							class="form-control input-number" value="1" min="1"
							max="${selectedProduct.stock-oi.qty}"> <span
							class="input-group-btn ml-2">
							<button type="button" class="quantity-right-plus btn"
								data-type="plus" data-field="">
								<i class="ion-ios-add"></i>
							</button>
						</span>
					</div>
					<div class="w-100"></div>
					<div class="col-md-12">
						<p style="color: #000;">${selectedProduct.content}${selectedProduct.unit}</p>
					</div>
				</div>
				<p>
					<a href="cart.html" class="btn btn-black py-3 px-5">加入購物車</a> <a
					href="#" onclick="goback()" class="btn btn-black py-3 px-5">返回 </a>
				</p>
			</div>
		</div>
	</div>
</section>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/scrollax.min.js"></script>
<!-- <script -->
<!-- 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<script>
		$(document).ready(function(){
		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        e.preventDefault();
		        var quantity = parseInt($('#quantity').val());
		            $('#quantity').val(quantity + 1);
		    });

		     $('.quantity-left-minus').click(function(e){
		        e.preventDefault();
		        var quantity = parseInt($('#quantity').val());
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });   
		});

		function goback(){
			$.ajax({
				url : "MallContent",
				type : "POST",
				data : {"categoryId":`${categoryId}`,"pageNo":`${pageNo}`,"searchString":`${searchString}`},
				datatype : "html",
				success : function(data, status) {
					$("#mainContent").html(data);
				},
				error : function(data, status) {
					$("#mainContent").html(data);
				}
			});
			}
	</script>