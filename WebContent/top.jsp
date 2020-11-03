<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="${pageContext.request.contextPath}/javascript/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/javascript/eDM.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/eDM.css" type="text/css" />



<c:set var='debug' value='true' scope='application' />
<table class='menuOuter'>
	<tr height="48px">
		<td width="60px" rowspan='2'>
			<!-- 網站照片 --> <img width="60px" height="40px"
			src="<c:url value='/images/farmer.png'  />">

		</td>
		<td>
			<table class='menuInner'>
				<tr>
					<td class='menuData'>
						<div class='menu'>
							<c:if test="${empty login_ok}">
								<a
									href="<c:url value='login.controller' />">
									登入 </a>
							</c:if>
						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>
							<c:if test="${ funcName != 'SHO' }">
								<a
									href="<c:url value='${request.contextPath}/RetrievePageProducts' />">
									商城 </a>
							</c:if>
							<c:if test="${ funcName == 'SHO' }"> 
                                                 商城
               </c:if>
						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>
							<c:if test="${ funcName != 'CHE' }">
								<a
									href="<c:url value='${request.contextPath}/marketSeller/MarketHome.jsp' />">
									市場 </a>
							</c:if>
							<c:if test="${ funcName == 'CHE' }"> 
                                               市場
              </c:if>
						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>
							<c:if test="${ funcName != 'ORD' }">
								<a
									href="<c:url value='${request.contextPath}/recipe/recipe_workpage.jsp' />">
									食譜 </a>
							</c:if>
							<c:if test="${ funcName == 'ORD' }"> 
                                                食譜
              </c:if>
						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>
							<c:if test="${ funcName != 'ACT' }">
								<a
									href="<c:url value='${request.contextPath}/Active/ActiveHome.jsp' />">
									活動 </a>
							</c:if>
							<c:if test="${ funcName == 'ACT' }"> 
                                             活動
              </c:if>
						</div>
					</td>
					<td class='menuData'>
						<div class='menu'>&nbsp;</div>
					</td>

					<td class='menuData'>
						<div class='menu'>
							<c:if test="${empty login_ok}">
								<c:if test="${ funcName != 'REG' }">
									<a
										href="<c:url value='memberSignUp.controller' />">
										註冊 </a>
								</c:if>

								<c:if test="${ funcName == 'REG' }"> 
                                                     註冊
            </c:if>
							</c:if>
						</div>
					</td>
					<td class='menuData'>
						<div class='menu' style='width: 50px;'>
							<c:if test="${ funcName != 'IND' }">
								<a href="<c:url value='${request.contextPath}/index.jsp' />">
									回首頁 </a>
							</c:if>
						</div>
					</td>

					<td class='menuData'>
						<div class='menu'>
							<c:if test="${ ! empty login_ok }">
								<a href="<c:url value='removeSession.controller' />"> 登出 </a>
							</c:if>
						</div>
					</td>
					<td class='menuData'><c:if test="${! empty login_ok }">
							${login_ok.member_name}&nbsp&nbsp&nbsp&nbsp&nbsp您好！
						</c:if></td>
				</tr>
				<tr height='20px'>
					<td width='300px' colspan='9'><small>${pageContext.session.id }</small>
					</td>
				</tr>

			</table>
	<tr>
		<td>
			<hr style="color: #f00; background-color: #f00; height: 2px;">
		</td>
	</tr>
</table>