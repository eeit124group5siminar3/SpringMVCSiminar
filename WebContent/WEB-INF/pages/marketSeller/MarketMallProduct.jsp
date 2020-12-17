<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="ftco-section carousel" id="top_singleProduct">
       <div align="center">
      <h1>歡迎來到 ${seller.mallName}</h1>
      </div>
       <div align="center">
      <h1>自行取貨時間為${seller.pickupTime}</h1>
      </div>
      <div align="center">
      	<p><a href="#" data-toggle="modal" data-target="#showMap" 
		  data-whatever="${seller.memberNo}"
		    class="btn btn-primary py-2 px-3">店面在這裡</a></p>
	   </div>
      <hr>
    <div>  
    
    	<div  class="row ftco-animate">
    	
    		<c:forEach var="item" items="${totalProducts}">
    			<div class="col-md-3 col-lg-2 ftco-animate">
    				<div class="product" >
    					<a href="#" onclick='goProduct(${item.productId})' class="img-prod"><img class="img-fluid" 
    					 src=<c:url value='MarketImageServlet?id=${item.marketProductImgBean.productId}&type=PRODUCT' />
    					  alt="Colorlib Template">
    					  <span class='status'>預購結束日${item.closeDay}</span>					
    						
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${item.productName}</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span class="price-sale">${item.price}元</span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="#" onclick='goProduct(${item.productId})'
	    							class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    		</c:forEach>
    		 
    		</div>
    	
    		<div align="center">
    		<p>
			 <a href="#" onclick="goback()" class="btn btn-black py-3 px-5">返回</a>
			</p>
			</div>
        </div>
        
        
    <div class="modal fade" id="showMap" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content" style="width:640px">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">市集地點</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="mapHere" style="width: 640px">

				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">關閉</button>
				</div>
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <jsp:include page="../js/Market.jsp" />
  <script>

$('#showMap').on('show.bs.modal', function (event) {
	var aHref = $(event.relatedTarget);
	var memberNo = aHref.data('whatever');
	$.ajax({
		url : "showMap",
		type : "POST",
		data : {
			"memberNo":memberNo	
		},
		datatype : "html",
		success : function(data, status) {
			$("#mapHere").html(data);
		},
		error : function(data, status) {
			$("#mapHere").html(data);
		}
	});			
	})
</script>

  