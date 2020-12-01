<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="col-lg-4 sidebar ftco-animate" align="center">
      <div class="sidebar-box">
          <form action="#" class="search-form">
            <div class="form-group">
              <span class="icon ion-ios-search"></span>
              <input type="text" class="form-control" placeholder="Search...">
            </div>
          </form>
      </div>
 </div>
 
 <div class="container">
  <c:forEach var="item" items="${sellerAll}">
   <div class="row">
         <div class="col-lg-8 ftco-animate">
			<div class="row">
				<div class="col-md-12 d-flex ftco-animate">
		            <div class="blog-entry align-self-stretch d-md-flex">
                       <img height='240' width='240'
                       src=<c:url value='MarketImageServlet?id=${item.memberNo}&type=MALLIMG' /> /> 
		              <div class="text d-block pl-md-4">
					<p class="text-left mr-4">
						<a href="#" class="mr-2">5.0</a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a>
					</p>
		                
		                <h3 class="heading">
		                <a href="#" onclick='goShopping(${item.memberNo})'>${item.mallName}</a>
		                </h3>
		                <a >${item.mallDescription}</a><br>
		                <p>地址 : ${item.address} </p>
		                <p><a href="#" onclick='goShopping(${item.memberNo})' class="btn btn-primary py-2 px-3">來去逛逛</a></p>
		              </div>
		              
		            </div>
		          </div>
			 </div>
			 
         </div> 
   </div>
   </c:forEach>
 </div>
 
 <div id="pages">
	<div class='row mt-5'>
		<div class='col text-center'>
			<div class='block-27'>
				<ul>
					<c:choose>
						<c:when test="${marketPageNo <= 1}">
							<li><span>&lt;&lt;</span></li>
							<li><span>&lt;</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="#"  onclick='mPage(1)'>&lt;&lt;</a></li>
							<li><a href="#"  onclick='mPage(${marketPageNo - 1})'>&lt;</a></li>
						</c:otherwise>
					</c:choose>
					
				     <c:choose>
						<c:when test="${totalPages <= 5}">
							<c:forEach begin="1" end="${totalPages}" step="1" var="i">
								<c:choose>
									<c:when test="${marketPageNo == i}">
										<li class='active'><span>${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a  href="#"  onclick='mPage(${i})'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:when test="${marketPageNo > (totalPages - 3)}">
							<c:forEach begin="${totalPages - 4}" end="${totalPages}" step="1"
								var="i">
								<c:choose>
									<c:when test="${marketPageNo == i}">
										<li href="#"  class='active'><span>${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a href="#"  onclick='mPage(${i})'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach begin="${marketPageNo - 2}" end="${marketPageNo + 2}" step="1"
								var="i">
								<c:choose>
									<c:when test="${marketPageNo == i}">
										<li class='active'><span>${i}</span></li>
									</c:when>
									<c:otherwise>
										<li><a onclick='mPage(${i})'>${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
                 	<c:choose>
						<c:when test="${marketPageNo >= totalPages}">
							<li><span>&gt;</span></li>
							<li><span>&gt;&gt;</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="#"  onclick='mPage(${marketPageNo + 1})'>&gt;</a></li>
							<li><a href="#"  onclick='mPage(${totalPages})'>&gt;&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
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


