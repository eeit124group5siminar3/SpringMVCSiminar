<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="py-1 bg-primary">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">+ 1235 2355 98</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">youremail@email.com</span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
							<span class="text">3-5 Business days delivery &amp; Free
								Returns</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar" style="height: 100px">
	<div class="container">
		<a class="navbar-brand" href="index.html" style="font-size: 35px"><img src="images\nungyulogo.png" width="40px" heigh="40px"> 農郁</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> 列表
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active" ><a href="<c:url value='/index' />"
					class="nav-link" style="font-size: 20px">首頁</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-tgogle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px">商城</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a  style="font-size: 15px" class="dropdown-item" href="<c:url value='/mall_shop' />">商城</a> 
						<a  style="font-size: 15px" class="dropdown-item" href="<c:url value='/mall_shoppingcart' />">購物車</a> 
						<a  style="font-size: 15px" class="dropdown-item" href="<c:url value='/mall_wishList' />">願望清單</a>
						<a  style="font-size: 15px" class="dropdown-item" href="<c:url value='/mall_order' />">查看訂單</a>
					</div></li>
				<!-- <li class="nav-item"><a href="product-single.html" class="nav-link">商城</a></li> -->
				
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-tgogle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px">預購</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a  style="font-size: 15px" class="dropdown-item" href="<c:url value='GoMarketHome'/>">店家</a>
						    <a  style="font-size: 15px" class="dropdown-item" href="<c:url value='/GoMarketShoppingcart' />">我的訂購商品清單</a> 
						    <a  style="font-size: 15px" class="dropdown-item" href="<c:url value='/MarketBuyerOrder' />">查看預購單</a>
							<a  style="font-size: 15px" class="dropdown-item" href="<c:url value='/GoShowNotice'/>">補貨通知</a>
						</div></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-tgogle" href="#" id="dropdown04" 
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px">活動</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a v class="dropdown-item" href="<c:url value='/actFarmerHome'/>">一日農夫</a>
						<a  style="font-size: 15px" class="dropdown-item" href="<c:url value='/actOrdSelect.do'/>">查詢報名</a>
					</div>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-tgogle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px">食譜</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item"  style="font-size: 15px"
							href="<c:url value='frontPage.controller'/>">食譜</a> 
							<a
							class="dropdown-item"  style="font-size: 15px"
							href="<c:url value='blogPage'/>">討論區</a>
<!-- 						<a class="dropdown-item" -->
<%-- 							href="<c:url value='analysisPage'/>">分析圖表</a>  --%>
<!-- 							<a -->
<!-- 							class="dropdown-item" -->
<%-- 							href="<c:url value='updatePage.controller'/>">我的食譜</a>  --%>
							<a
							class="dropdown-item"
							href="<c:url value='myRecipe'/>">我的最愛</a>
					</div></li>

				<li class="nav-item dropdown"><c:if test="${empty login_ok}">
						<a  class="nav-link" href="<c:url value='login.controller' />" style="font-size: 20px">會員</a>
					</c:if> <c:if test="${!empty login_ok}">
					<form class="nav-link"name="form1" action="memberUpdate.controller" method="post">
					<a href="javascript:document.form1.submit();" style="font-size: 20px;color:black">會員</a></form>
					</c:if></li>
				<li class="nav-item"><c:if test="${empty login_ok}">
						<a class="nav-link" href="<c:url value='login.controller' />" style="font-size: 20px">登錄</a>
					</c:if><c:if test="${!empty login_ok}">
						<a class="nav-link" href="<c:url value='removeSession.controller' />" style="font-size: 20px">登出</a>
					</c:if></li>
				<li class="nav-item cta cta-colored" style="padding-top:10px"><a href="<c:url value='/mall_shoppingcart' />" id="shoppingcartItem"
					class="nav-link"><span class="icon-shopping_cart"></span>[${ShoppingCart.itemNumber}]</a></li>
					
				<li class="nav-item cta cta-colored" style="padding-top:10px"><a href="<c:url value='' />"
					class="nav-link"><img height='15' width='15'
					 src="images/MarketBasket.jpg">[${MarketCart.itemNumber}]</a></li>
			<c:if test="${!empty login_ok}">				
				<li class="nav-item cta cta-colored" style="padding-top:10px"><a class="nav-link" style="font-size: 10px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNo.${login_ok.member_no}&nbsp&nbsp${login_ok.member_name}&nbsp您好！ </a></li>
			</c:if>	
			</ul>
<%-- 			<c:if test="${!empty login_ok}"> --%>
<!-- 			<ul class="navbar-nav"> -->
<!-- 				<li class="nav-item cta cta-colored"><a class="nav-link" style="font-size: 15px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNo.${login_ok.member_no}&nbsp&nbsp${login_ok.member_name}&nbsp您好！ </a></li> -->
<!-- 			</ul> -->
<%-- 			</c:if> --%>
		</div>
	</div>
</nav>

<!-- -------------------------sidebar------------------------------------------------------------------------------ -->


<div class="wrapper">
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4" style="background-color:#82ae46; color:white " >
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <span class="brand-text font-weight-light">管理系統</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar" >
<!--       Sidebar user panel (optional) -->
<!--       <div class="user-panel mt-3 pb-3 mb-3 d-flex"> -->
<!--         <div class="info"> -->
<!--           <a href="#" class="d-block">管理系統</a> -->
<!--         </div> -->
<!--       </div> -->

      <!-- Sidebar Menu -->
      <nav class="mt-2" >
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false" >
          <li class="nav-item" >
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-user" style="color:#FFFFFF"></i>
              <p style="color:white ">
               	 會員管理
                <i class="fas fa-angle-left right"></i>
<!--                 <span class="badge badge-info right">6</span> -->
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <form name="formsignup" action="memberUpdate.controller" method="post">
                <a href="javascript:document.formsignup.submit();" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>資料修改</p>
                </a>
                </form>
              </li>

            </ul>
          </li>
          <li class="nav-item" >
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-store" Style="color:#FFFFFF"></i>
              <p Style="color:#FFFFFF ">
               	 商城管理
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <c:if test="${login_ok.member_permissions==1}">
              <li class="nav-item">
                <a href="<c:url value='mall_management'  />" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>商品管理</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='mall_manageOrder'  />" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>訂單管理</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='mall_analysis'  />" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>商品資料分析</p>
                </a>
              </li>
             </c:if>
			
             	<c:if test="${login_ok.member_permissions!=1}">
              <li class="nav-item">
            	<a class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>商品管理</p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>訂單管理</p>
                </a>
              </li>
              <li class="nav-item">
               <a class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>商品資料分析</p>
                </a>
              </li>
             </c:if> 
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-clock" style="color:#FFFFFF"></i>
              <p style="color:#FFFFFF">
              	預購管理
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<c:url value='MarketMall.GoUpdate'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>商家資訊</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='MarketProduct.selectAll'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>商品管理</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='MarketSellerOrder'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>預購單管理</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-book" style="color:#FFFFFF"></i>
              <p style="color:#FFFFFF">
 				食譜管理
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            
            <c:if test="${empty memDetail}">
              <li class="nav-item">
                <a href="<c:url value='completeDetail?mem_no=${login_ok.member_no}'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>上傳食譜</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='completeDetail?mem_no=${login_ok.member_no}'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>我的食譜</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='myRecipe'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>我的最愛</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='completeDetail?mem_no=${login_ok.member_no}'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>文章管理</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='completeDetail?mem_no=${login_ok.member_no}'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>修改資料</p>
                </a>
              </li>
                 <li class="nav-item">
                <a href="<c:url value='analysisPage'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>文章分析圖表</p>
                </a>
              </li>
              </c:if>
              
			  <c:if test="${!empty memDetail}">
              <li class="nav-item">
                <a href="<c:url value='uploadPage.controller'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>上傳食譜</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='updatePage.controller'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>我的食譜</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='myRecipe'/>" class="nav-link">
                 &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>我的最愛</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='blog_personal'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>文章管理</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='completeDetail?mem_no=${login_ok.member_no}'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>修改資料</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='analysisPage'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>文章分析圖表</p>
                </a>
              </li>
              </c:if>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-flag" style="color:#FFFFFF"></i>
              <p style="color:#FFFFFF">
				活動管理
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <c:if test="${login_ok.member_permissions==1}">
             <li class="nav-item">
                <a href="<c:url value='/allActFarmer.do'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>一日農夫</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='/actOrdSelectMaingo.do'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>已報名活動</p>
                </a>
              </li>
            </c:if>
			<c:if test="${login_ok.member_permissions!=1}">
              <li class="nav-item">
                <a href="<c:url value='/actOrdSelectMaingo.do'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>已報名活動</p>
                </a>
              </li>
            </c:if>
            </ul>
          </li>
          <li class="nav-header"></li>
          <li class="nav-item"></li>
        </ul>
      </nav>
<!--       /.sidebar-menu -->
    </div>
<!--     /.sidebar -->
  </aside>
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->




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

	<script src="js/plugins/bootstrap.bundle.min.js"></script>
	<script src="js/dist/adminlte.js"></script>
	<script src="js/charts/Chart.min.js"></script>
	<script src="js/dist/demo.js"></script>
<!-- <script -->
<!-- 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!-- <script src="js/google-map.js"></script> -->
<script src="js/main.js"></script>