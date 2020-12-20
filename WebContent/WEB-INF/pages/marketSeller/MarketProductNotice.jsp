<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="ftco-section carousel" id="top_singleProduct">
       <div class="container">
        <div>  
        	<div  class="row ftco-animate">
    		<c:forEach var="item" items="${notice}">
    			<div class="col-md-3 col-lg-3 ftco-animate">
    				<div class="product" >
    					<a href="#" onclick='goProduct(${item.marketProductTotalBean.productId})' class="img-prod"><img class="img-fluid" 
    					 src=<c:url value='MarketImageServlet?id=${item.marketProductTotalBean.marketProductImgBean.productId}&type=PRODUCT' />
    					  alt="Colorlib Template">
    			   <c:choose>
    					    <c:when test="${item.marketProductTotalBean.quantity>=1}">
    					  <span class='status'style="color:black;font-size:25px;" >補貨囉</span>					
    						</c:when>
    						<c:otherwise>
    					  <span class='status'style="color:red;font-size:25px;" >未補貨</span>					
    						</c:otherwise>
    				</c:choose>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${item.marketProductTotalBean.productName}</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span class="price-sale">${item.marketProductTotalBean.price}元</span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="#" onclick='goProduct(${item.marketProductTotalBean.productId})'
	    							class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a href="#" onclick='removeNotice(${item.noticeId})'
	    							class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-close"style="color:red;font-size:25px;" ></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    		</c:forEach>
    		 
    		</div>
    	</div>
    		<div align="center">
    		<p>
			 <a href="#" onclick="goback()" class="btn btn-black py-3 px-5">返回</a>
			</p>
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

</script>
        