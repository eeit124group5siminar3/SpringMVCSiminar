<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
                <form name="form1" action="memberUpdate.controller" method="post">
                <a href="javascript:document.form1.submit();" class="nav-link">
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
                <a href="<c:url value='/actOrdSelect.do'/>" class="nav-link">
                  &emsp;&emsp;<i class="far fa-circle nav-icon"></i>
                  <p>已報名活動</p>
                </a>
              </li>
            </c:if>
			<c:if test="${login_ok.member_permissions!=1}">
              <li class="nav-item">
                <a href="<c:url value='/actOrdSelect.do'/>" class="nav-link">
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
<script src="js/main.js"></script>