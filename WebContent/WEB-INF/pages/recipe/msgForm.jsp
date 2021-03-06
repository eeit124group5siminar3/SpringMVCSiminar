<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <h3 class="mb-5">${counts}&nbsp;&nbsp;Comments</h3>
              <c:forEach var='BeanToken' items="${searchMsg}">
                <ul class="comment-list">
                          <li class="comment">
                           <c:if test="${BeanToken.mem_no!=null}">
										<div class="vcard bio">
											<img src="<c:url value='getImage?mem_no=${BeanToken.mem_no}'/>" alt="Image placeholder">
										</div>
									</c:if>	
                           <c:if test="${BeanToken.mem_no==null}">
										<div class="vcard bio">
										</div>
									</c:if>	
                            <div class="comment-body">
                             <c:if test="${BeanToken.mem_no!=null}">
                              <h3 class="alert alert-success">${BeanToken.name}</h3>
                            </c:if>
                            <c:if test="${BeanToken.mem_no==null}">
                              <h3 class="alert alert-dark">${BeanToken.name}</h3>
                            </c:if>
                              <div class="meta">${BeanToken.date}</div>
                              <p>${BeanToken.content}</p>
                              <p>
                                <a href="#" class="reply">Reply</a>
                              </p>
                            </div>
                          </li>
              </ul>
              </c:forEach>
</body>
</html>