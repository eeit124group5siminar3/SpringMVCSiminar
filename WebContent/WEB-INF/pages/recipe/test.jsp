<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Client Side jQuery DataTables</title>
    <!--引用css-->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
</head>
<body>

    
    <table id="myDataTalbe"  class="display"  >
        <thead>
            <!--必填-->

            <tr>
                <th>#</th>
                <th>MyTitle</th>
                <th>MyMoney</th>
                <th>ActionButton</th>
            </tr>
        </thead>
        
            
            
<!--            <section class="ftco-section"> -->
<!--     	<div class="container"> -->
<!--     		<div class="row justify-content-center"> -->
<!--     			<div class="col-md-10 mb-5 text-center"> -->
<!--     				<ul class="product-category"> -->
<!--     					<li><a href="#" class="active">All</a></li> -->
<!--     					<li><a href="#">Vegetables</a></li> -->
<!--     					<li><a href="#">Fruits</a></li> -->
<!--     					<li><a href="#">Juice</a></li> -->
<!--     					<li><a href="#">Dried</a></li> -->
<!--     				</ul> -->
<!--     			</div> -->
<!--     		</div> -->
    		
<!--     		<div id="searchSuccess"> -->
    		
<!--     		<div class="row"> -->
    		<c:forEach var='BeanToken'  items="${searchAll}">
<!--         			<div class="col-md-6 col-lg-3 ftco-animate"> -->
<!--     				<div class="product">								 -->
<%--     						<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>" class="img-prod"><img class="img-fluid" src="<c:url value='/getALLImage.controller?rec_id=${BeanToken.rec_id}'/>" alt=""> --%>
<!--     						</a>	 -->
    						<tr><td>
<!--     					<div class="text py-3 pb-4 px-3 text-center"> -->
    							<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
    						


</td>


<td>
<!--     					<div class="text py-3 pb-4 px-3 text-center"> -->
    							<a href="<c:url value='/recipeDetail.controller?rec_id=${BeanToken.rec_id}'/>">${BeanToken.name}</a>
    						


</td>


<tr>
	<td>
			
	</td>
</tr>





<!--     						<div class="d-flex"> -->
<!--     							<div class="pricing"> -->
<!-- 		    						<p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p> -->
<!-- 		    					</div> -->
<!-- 	    					</div> -->
<!-- 	    					<div style="float: right;"> -->
<!-- 	    						<div class="m-auto d-flex"> -->
<!-- 	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center"> -->
<!-- 	    								<span><i class="ion-ios-menu"></i></span> -->
<!-- 	    							</a> -->
<!-- 	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1"> -->
<!-- 	    								<span><i class="ion-ios-cart"></i></span> -->
<!-- 	    							</a> -->
<%-- 	    							<a href="<c:url value='/bookmark?rec_id=${BeanToken.rec_id}'/>" class="heart d-flex justify-content-center align-items-center " id="heart" > --%>
<!-- 	    								<span><i class="ion-ios-heart"></i></span> -->
<!-- 	    							</a> -->
<!--     							</div>   -->
<!--     						</div> -->
    						</tr>
<!--     					</div> -->
<!--     				</div> -->
<!--     			</div> -->
    		
    		
    		</c:forEach>
    		            </table>
    		
<!--     		</div> -->
<!--     		<div class="row mt-5"> -->
<!--           <div class="col text-center"> -->
<!--             <div class="block-27"> -->
<!--               <ul> -->
<!--                 <li><a href="#">&lt;</a></li> -->
<!--                 <li class="active"><span>1</span></li> -->
<!--                 <li><a href="#">2</a></li> -->
<!--                 <li><a href="#">3</a></li> --><!--     		</div> -->
<!--     		<div class="row mt-5"> -->
<!--           <div class="col text-center"> -->
<!--             <div class="block-27"> -->
<!--               <ul> -->
<!--                 <li><a href="#">&lt;</a></li> -->
<!--                 <li class="active"><span>1</span></li> -->
<!--                 <li><a href="#">2</a></li> -->
<!--                 <li><a href="#">3</a></li> -->
<!--                 <li><a href="#">4</a></li> -->
<!--                 <li><a href="#">5</a></li> -->
<!--                 <li><a href="#">&gt;</a></li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--     	</div> -->
<!--     	</div> -->
<!--                 <li><a href="#">4</a></li> -->
<!--                 <li><a href="#">5</a></li> -->
<!--                 <li><a href="#">&gt;</a></li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--     	</div> -->
<!--     	</div> -->
    	
    </section>


    <!--引用jQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <!--引用dataTables.js-->
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
     
    <script type="text/javascript">
        $(function () {

            $("#myDataTalbe").DataTable({
                searching: true, //關閉filter功能
                columnDefs: [{
                    targets: [3],
                    orderable: false,
                }]
            });
        });
    </script>
</body>
</html>