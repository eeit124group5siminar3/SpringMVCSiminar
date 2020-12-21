<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<title>文章資料分析</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- -------------------DataTable引入的CDN---------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="css/fontawesome-free/all.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/dist/adminlte.min.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body class="hold-transition sidebar-mini goto-here">
	<jsp:include page="../header.jsp" />
	<div class="wrapper" id="analysisPage">
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<a href="index3.html" class="brand-link"> </a>
			<div class="sidebar">
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="info" align="center">
						<span style="font-size: 20px; color: white; margin-bottom: 0">歡迎使用!&nbsp;&nbsp;${login_ok.member_name}</span>
					</div>
				</div>
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									個人文章資料分析 <i class="right fas fa-angle-left"></i></span>
								</p>
						</a>
							<ul class="nav nav-treeview" style="">
								<li class="nav-item"><a class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>每月文章討論度分析</p>
								</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</aside>
		<section>
			<div class="content-wrapper">
				<div class="col-9" style="width: 80%; margin: 0 auto" id="blogList">
					<div
						class="form-inline row justify-content-center align-items-center">
						<h2>我的文章</h2>
						&emsp;&emsp;&emsp;
					</div>
					<table id="myRecipe" class="table table-striped table-bordered"
						style="width: 100%">
						<thead>
							<tr>
								<th width="50">文章標題</th>
								<th width="50">上傳日期</th>
								<th width="50">作者</th>
								<th width="50">回文</th>
								<th width="100"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bean" items="${blogList}">
								<tr>
									<td><a href="./SinglePage?blog_id=${bean.blog_id}">${bean.title}</a></td>
									<td>${bean.date}</td>
									<td>${bean.name}</td>
									<td>${bean.counts}</td>
									<td>
										<div class="form-inline justify-content-center">
											<a href="#" onclick="funPerMonth(${bean.blog_id})"
												class="btn btn-primary py-2 px-3 ">查詢</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<!-- 				<label style="font-size: 20px;">月份 </label> <select -->
				<!-- 					class="form-control" id="chooseMonth" > -->
				<!-- 					<option value="">Open this select menu</option> -->
				<!-- 					<option value="1">1月</option> -->
				<!-- 					<option value="2">2月</option> -->
				<!-- 					<option value="3">3月</option> -->
				<!-- 					<option value="4">4月</option> -->
				<!-- 					<option value="5">5月</option> -->
				<!-- 					<option value="6">6月</option> -->
				<!-- 					<option value="7">7月</option> -->
				<!-- 					<option value="8">8月</option> -->
				<!-- 					<option value="9">9月</option> -->
				<!-- 					<option value="10">10月</option> -->
				<!-- 					<option value="11">11月</option> -->
				<!-- 					<option value="12">12月</option> -->

<!-- 				</select>  -->
<!-- 				<label style="font-size: 20px;" class="input-group-text"> -->
<!-- 					種類: </label>  -->
<!-- 				<select class="form-control" id="displayType"> -->
<!-- 					<option value="">Open this select menu</option> -->
<!-- 					<option value="bar">bar</option> -->
<!-- 					<option value="pie">pie</option> -->
<!-- 					<option value="horizontalBar">horizontalBar</option> -->
<!-- 					<option value="line">line</option> -->
<!-- 					<option value="doughnut">doughnut</option> -->
<!-- 					<option value="radar">radar</option> -->
<!-- 					<option value="polarArea">polarArea</option> -->
<!-- 				</select> -->
				<div class="container">
					<canvas id="myChart"></canvas>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
	<script src="js/jquery.min.js"></script>
	<script src="js/plugins/bootstrap.bundle.min.js"></script>
	<script src="js/dist/adminlte.js"></script>
	<script src="js/charts/Chart.min.js"></script>
	<script src="js/dist/demo.js"></script>
	<script type="text/javascript">
		function funPerMonth(blog_id) {
			var month = $("#chooseMonth").val();
			console.log('month: ' + month);
// 			var displayType = $("#displayType").val();
// 			console.log('displayType: ' + displayType);
			$.ajax({
				url : "./getMonthAnalysis",
				type : "post",
				data : {
						"blog_id":blog_id
				},
				success : function(data) {
// 					console.log('length: ' + data.length);
					var list=data.list;
					var month1=data.month1;
					var month2=data.month2;
					var month3=data.month3;
					var month4=data.month4;
					var month5=data.month5;
					var month6=data.month6;
					var month7=data.month7;
					var month8=data.month8;
					var month9=data.month9;
					var month10=data.month10;
					var month11=data.month11;
					var month12=data.month12;
					console.log('month3: ' + month3);
					console.log('month4: ' + month4);
					console.log('month5: ' + month5);
					console.log('month8: ' + month8);
					console.log('month9: ' + month9);
					console.log('month10: ' + month10);
					console.log('month11: ' + month11);
					console.log('month12: ' + month12);
					
  let myChart=document.getElementById('myChart').getContext('2d');
            
            Chart.defaults.global.defaultFontFamily='Lato';
            Chart.defaults.global.defaultFontColor='brown';

					 let massPopChart=new Chart(myChart,{
			                //bar or pie or horizontalBar , line , doughnut , radar , polarArea
			                type:'bar',
			                data:{
			                    labels:['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			                    datasets:[{
			                        label:'文章熱門度分析',
			                        data:[
			                        	month1,
			                        	month2,
			                        	month3,
			                        	month4,
			                        	month5,
			                        	month6,
			                        	month7,
			                        	month8,
			                        	month9,
			                        	month10,
			                        	month11,
			                        	month12
			                        ],
			                        // backgroundCol	or:'black'
			                        backgroundColor:[
			                            'rgb(255,99,132,0.6)',
			                            'rgb(54,162,235,0.6)',
			                            'rgb(255,206,86,0.6)',
			                            'rgb(75,192,192,0.6)',
			                            'rgb(153,102,255,0.6)',
			                            'rgb(255,159,64,0.6)',
			                            'rgb(255,99,132,0.6)',
			                            'rgb(54,162,235,0.6)',
			                            'rgb(255,206,86,0.6)',
			                            'rgb(75,192,192,0.6)',
			                            'rgb(153,102,255,0.6)',
			                            'rgb(255,159,64,0.6)'

			                        ],
			                        borderWidth:1,
			                        borderColor:'#777',
			                        hoverBorderWidth:3,
			                        hoverBorderColor:"green"

			                    }]
			                },

			                options:{
			                    title:{
			                        display:true,
			                        text:'most popular month',
			                        fontSize:25
			                    },
			                    legend:{
			                        display:true,
			                        position:'bottom',
			                        fontSize:25,
			                        labels:{
			                        fontColor:'blue'

			                        }

			                    },
			 
			                    layout:{
			                        padding:{
			                            left:50,
			                            right:0,
			                            bottom:0,
			                            top:0

			                        }

			                    },
			                    tooltips:{
			                        //滑鼠停放顯示資訊
			                        enabled:true
			                    }
			                }
			            });
	
				}
			});
		}
	</script>
	<script type="text/javascript">
// 	function myblogList(){
// 		$.ajax({
// 			type:"post",
// 			url:"./myBlogList",
// 			success:function(data){
// 				alert(data);
// 				for(var i=0;i<data.length;i++){  
//                 	var val=data[i]; 
					
// 			}
// 				$("#blogList").html();
// 			}
// 			});
// 		}

	</script>
	<script>
		function setChart(data) {
// 			var displayType = $("#displayType").val();
// 			console.log('displayType: ' + displayType);
// 			var month = $("#chooseMonth").val();
// 			console.log('month: ' + month);
			console.log('list: ' + data);
			console.log('list: ' + data[0]);
			
            let myChart=document.getElementById('myChart').getContext('2d');
            
            Chart.defaults.global.defaultFontFamily='Lato';
            Chart.defaults.global.defaultFontColor='brown';

            let massPopChart=new Chart(myChart,{
                //bar or pie or horizontalBar , line , doughnut , radar , polarArea
                type:'polarArea',
                data:{
                    labels:['boston','worces','springfield','lowell','Cambridge','new bedford'],
                    datasets:[{
                        label:'Population',
                        data:[
                        	data

                        ],
                        // backgroundColor:'black'
                        backgroundColor:[
                            'rgb(255,99,132,0.6)',
                            'rgb(54,162,235,0.6)',
//                             'rgb(255,206,86,0.6)',
//                             'rgb(75,192,192,0.6)',
//                             'rgb(153,102,255,0.6)',
//                             'rgb(255,159,64,0.6)',

                        ],
                        borderWidth:1,
                        borderColor:'#777',
                        hoverBorderWidth:3,
                        hoverBorderColor:"green"

                    }]
                },

                options:{
                    title:{
                        display:true,
                        text:'most populcation',
                        fontSize:25
                    },
                    legend:{
                        display:true,
                        position:'right',
                        labels:{
                        fontColor:'blue'

                        }

                    },
 
                    layout:{
                        padding:{
                            left:50,
                            right:0,
                            bottom:0,
                            top:0

                        }

                    },
                    tooltips:{
                        //滑鼠停放顯示資訊
                        enabled:true
                    }
                }
            })

	</script>
</body>
</html>
