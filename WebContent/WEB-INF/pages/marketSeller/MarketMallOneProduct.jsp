<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    	<div class="container">
    		<div class="row">
    		
    			<div  class="col-lg-6 mb-5 ftco-animate">
    				<a href="#"  class="image-popup" >
    				<img src=<c:url value='MarketImageServlet?id=${oneProduct.marketProductImgBean.productId}&type=PRODUCT' />
    				 class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h3>${oneProduct.productName}</h3>
    				<div class="rating d-flex">
							<p class="text-left mr-4">
								<a href="#" class="mr-2">5.0</a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
							</p>
							<p class="text-left mr-4">
								<a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">Rating</span></a>
							</p>
							<p class="text-left">
								<a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>
							</p>
						</div>
    				<p class="price"><span>${oneProduct.price}元</span></p>
    				<p>${oneProduct.marketProductImgBean.description}
						</p>
						
						<div class="row mt-4">
							<div class="col-md-6">
								<div class="form-group d-flex">
		              <div class="select-wrap">
	                  
	                </div>
		            </div>
							</div>
							<div class="w-100"></div>
					<div class="input-group col-md-6 d-flex mb-3">
						<span class="input-group-btn mr-2"> </span> <input type="number"
							id="quantity" name="quantity" class="form-control input-number"
							value="1" min="1" max="${oneProduct.quantity-marketOrder.quantity}">
						<span class="input-group-btn ml-2"> </span>
					</div>
	          	<div class="col-md-12">
						<p style="color: #000;">庫存:${oneProduct.quantity-marketOrder.quantity}</p>
			    </div>
	          	<div class="w-100"></div>
	         
          	</div>
          	<div class="row">
          	<p>
          	<c:choose>
          	<c:when test="${oneProduct.quantity<=marketOrder.quantity}">	
          	<a href="#" onclick="notEnough()" class="btn btn-black py-3 px-5">放入菜籃</a>  	
          	</c:when>
          	<c:otherwise>
			<a href="#" onclick="addToCart(${oneProduct.quantity-marketOrder.quantity})" class="btn btn-black py-3 px-5">放入菜籃</a>					
			</c:otherwise>
          	</c:choose>
          	</p>&nbsp;        	
          	<p><a href="<c:url value='GoMarketShoppingcart'/>" class="btn btn-black py-3 px-5">查看菜籃</a></p>
          	<p><a href="#" onclick="goShopping(${oneProduct.marketMallBean.memberNo})" class="btn btn-black py-3 px-3">返回</a></p>
          	</div>
    			</div>
    		</div>
    	</div> 
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
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>

<jsp:include page="../js/Market.jsp" />
  <script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>
