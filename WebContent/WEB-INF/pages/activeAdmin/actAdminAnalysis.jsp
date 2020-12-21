<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
  .billboard{

    margin-top: 10%;
    margin-left: 10%;
    margin-right: 10%;
  }

  table,th,td{
    text-align: center;
    border-collapse:collapse;
    border: 1px solid black;
  }
  .login-form {
	width: 400px;
	height: 600px;
	position: relative;
	top: 150px;
	left: 60%;
	/* right:50px; */
}

.login-form-fieldset {
	width: 500px;
	margin: 10px;
	padding: 50px;
	border: 1px double;
}
</style>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.0.5/css/adminlte.min.css" integrity="sha512-rVZC4rf0Piwtw/LsgwXxKXzWq3L0P6atiQKBNuXYRbg2FoRbSTIY0k2DxuJcs7dk4e/ShtMzglHKBOJxW8EQyQ==" crossorigin="anonymous" />  

<!-- -------------------websocket引入的CDN---------------------------------------------------------------------- -->

 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
 <link rel="stylesheet" href="css/admin_chatbox.css">


<title>農郁-活動後臺管理</title>
</head>
<body class="hold-transition sidebar-mini">
<!--------------------------- 	header ------------------------------------------>
	<jsp:include page="/WEB-INF/pages/testAdminH.jsp" />
	<jsp:include page="/WEB-INF/pages/Admin_message.jsp" />


<!--------------------------- 	內容 ------------------------------------------>
<div class="wrapper">

  <!-- Content Wrapper. Contains page content -->
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>活動分析</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">活動管理</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <!-- Small boxes (Stat box) -->
        <div class="row" id="count">
<!--           <div class="col-lg-3 col-6"> -->
<!--             small box -->
<!--             <div class="small-box bg-info"> -->
<!--               <div class="inner"> -->
<!--                 <h3>150</h3> -->

<!--                 <p>New Orders</p> -->
<!--               </div> -->
<!--               <div class="icon"> -->
<!--                 <i class="ion ion-bag"></i> -->
<!--               </div> -->
<!--               <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
<!--             </div> -->
<!--           </div> -->
<!--           ./col -->
<!--           <div class="col-lg-3 col-6"> -->
<!--             small box -->
<!--             <div class="small-box bg-success"> -->
<!--               <div class="inner"> -->
<!--                 <h3>53<sup style="font-size: 20px">%</sup></h3> -->

<!--                 <p>Bounce Rate</p> -->
<!--               </div> -->
<!--               <div class="icon"> -->
<!--                 <i class="ion ion-stats-bars"></i> -->
<!--               </div> -->
<!--               <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
<!--             </div> -->
<!--           </div> -->
<!--           ./col -->
<!--           <div class="col-lg-3 col-6"> -->
<!--             small box -->
<!--             <div class="small-box bg-warning"> -->
<!--               <div class="inner"> -->
<!--                 <h3>44</h3> -->

<!--                 <p>User Registrations</p> -->
<!--               </div> -->
<!--               <div class="icon"> -->
<!--                 <i class="ion ion-person-add"></i> -->
<!--               </div> -->
<!--               <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
<!--             </div> -->
<!--           </div> -->
<!--           ./col -->
<!--           <div class="col-lg-3 col-6"> -->
<!--             small box -->
<!--             <div class="small-box bg-danger"> -->
<!--               <div class="inner"> -->
<!--                 <h3>65</h3> -->

<!--                 <p>Unique Visitors</p> -->
<!--               </div> -->
<!--               <div class="icon"> -->
<!--                 <i class="ion ion-pie-graph"></i> -->
<!--               </div> -->
<!--               <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
<!--             </div> -->
<!--           </div> -->
<!--           ./col -->
        </div>
        <!-- /.row -->
      
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
<!--             AREA CHART -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">每個月總訂單數</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="areaChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
<!--               /.card-body -->
            </div>
<!--             /.card -->

<!--             DONUT CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">活動類型訂單比例圖</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
<!--               /.card-body -->
            </div>
<!--             /.card -->

<!--             PIE CHART -->
<!--             <div class="card card-danger"> -->
<!--               <div class="card-header"> -->
<!--                 <h3 class="card-title">Pie Chart</h3> -->

<!--                 <div class="card-tools"> -->
<!--                   <button type="button" class="btn btn-tool" data-card-widget="collapse"> -->
<!--                     <i class="fas fa-minus"></i> -->
<!--                   </button> -->
<!--                   <button type="button" class="btn btn-tool" data-card-widget="remove"> -->
<!--                     <i class="fas fa-times"></i> -->
<!--                   </button> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="card-body"> -->
<!--                 <canvas id="pieChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas> -->
<!--               </div> -->
<!--               /.card-body -->
<!--             </div> -->
<!--             /.card -->

          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-6">
<!--             LINE CHART -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">活動每月總營收</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="lineChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
<!--               /.card-body -->
            </div>
<!--             /.card -->

<!--             BAR CHART -->
<!--             <div class="card card-success"> -->
<!--               <div class="card-header"> -->
<!--                 <h3 class="card-title">Bar Chart</h3> -->

<!--                 <div class="card-tools"> -->
<!--                   <button type="button" class="btn btn-tool" data-card-widget="collapse"> -->
<!--                     <i class="fas fa-minus"></i> -->
<!--                   </button> -->
<!--                   <button type="button" class="btn btn-tool" data-card-widget="remove"> -->
<!--                     <i class="fas fa-times"></i> -->
<!--                   </button> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="card-body"> -->
<!--                 <div class="chart"> -->
<!--                   <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas> -->
<!--                 </div> -->
<!--               </div> -->
<!--               /.card-body -->
<!--             </div> -->
<!--             /.card -->

<!--             STACKED BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">各種類活動的總營收比較圖</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="stackedBarChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
<!--               /.card-body -->
            </div>
<!--             /.card -->

          </div>
<!--           /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<!-- Bootstrap 4 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script><!-- ChartJS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
<!-- AdminLTE App -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.0.5/js/adminlte.min.js" integrity="sha512-++c7zGcm18AhH83pOIETVReg0dr1Yn8XTRw+0bWSIWAVCAwz1s2PwnSj4z/OOyKlwSXc4RLg3nnjR22q0dhEyA==" crossorigin="anonymous"></script><!-- AdminLTE for demo purposes -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.0.5/js/demo.min.js" integrity="sha512-FFW8h53XFcoFrg7qgP9jvHMsGR5d/xg4dnU9oQY/1emSKRDEzhkw9FJzaEKon04ugKVBveZYJsjoX0VLGl5+iQ==" crossorigin="anonymous"></script><!-- Page specific script -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script >

$(document).ready(function(){

	$.get({
		url:"${pageContext.request.contextPath}/actTotal.do",
		success:function(response,status){
			var length = Object.keys(response.list).length;
			let data = Object.values(response.list);
			console.log(data);
			let content="";
			content=
			`<div class="col-lg-3 col-6">
            <div class="small-box bg-info">
              <div class="inner">
                <h3>$\${data[0]}</h3>
                <p>總活動總收益</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">Active</a>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="small-box bg-success">
              <div class="inner">
                <h3>\${data[1]}</h3>
                <p>總活動訂單數</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">Active</i></a>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>\${data[2]}</h3>
                <p>總活動數</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="#" class="small-box-footer">Active</a>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>\${data[3]}</h3>
                <p>累積活動報名人數</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">Active</a>
            </div>
          </div>`;
		$('#count').html(content);
		}
		});

	//訂單月總數
	var data=[];
	var ctx = document.getElementById("areaChart");
	console.log(ctx);
	$.post({
		url:"${pageContext.request.contextPath}/monthlyActCounts.do",
		success:function(response,status){
			const datas= response.actMonOrdCounts
			const options= response.month
			console.log(datas)
			var areaChartCanvas = $('#areaChart').get(0).getContext('2d')
			var areaChartDataf = {
			       labels  : options,
			       datasets: [
			         {
			           label               : '每個月總訂單數',
			           backgroundColor     : 'rgba(60,141,188,0.9)',
			           borderColor         : 'rgba(60,141,188,0.8)',
			           pointColor          : '#3b8bba',
			           pointStrokeColor    : 'rgba(60,141,188,1)',
			           pointHighlightFill  : '#fff',
			           pointHighlightStroke: 'rgba(60,141,188,1)',
			           data                : datas
			         },
			       ]
			     }

			     var areaChartOptionsf = {
			       maintainAspectRatio : false,
			       responsive : true,
			       legend: {
			         display: false
			       },
			       scales: {
			         xAxes: [{
			           gridLines : {
			             display : false,
			           }
			         }],
			         yAxes: [{
			           gridLines : {
			             display : false,
			           }
			         }]
			       }
			     }
		     

			     var areaChart = new Chart(areaChartCanvas, {
			       type: 'line',
			       data: areaChartDataf,
			       options: areaChartOptionsf
			     })
		}
		})	
		//月總營收
	var data=[];
	var ctx = document.getElementById("lineChart");
	console.log(ctx);
	$.post({
		url:"${pageContext.request.contextPath}/actMonthTotalSales.do",
		success:function(response,status){
			const data= response.actMonthlySales
			const options= response.month
			
			var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
			var areaChartDatas = {
			        labels: options,
			        datasets: [
			            {
			                label: "活動月總營收",
			                fillColor: "rgba(220,220,220,0.2)",
			                strokeColor: "rgba(220,220,220,1)",
			                pointColor: "rgba(220,220,220,1)",
			                pointStrokeColor: "#fff",
			                pointHighlightFill: "#fff",
			                pointHighlightStroke: "rgba(220,220,220,1)",
			                data: data
			            }
			            ]
			}
			var areaChartOptions = {
				      maintainAspectRatio : false,
				      responsive : true,
				      legend: {
				        display: false
				      },
				      scales: {
				        xAxes: [{
				          gridLines : {
				            display : false,
				          }
				        }],
				        yAxes: [{
				          gridLines : {
				            display : false,
				          }
				        }]
				      }
				    }
		     var lineChart = new Chart(lineChartCanvas, {
		       type: 'line',
		       data: areaChartDatas,
		       options: areaChartOptions
		     })	
		}
		})
		


	
	var data = [];
	var ctx = document.getElementById("donutChart");
	console.log(ctx);
	$.post({
		url: "${pageContext.request.contextPath}/actAnalysisType.do",
// 		datatype: "json",
		success:function(response,status){
			console.log(response.actTypeData.exp);
			var length  = Object.keys(response.actTypeData).length
			console.log(length);
			const data = Object.values(response.actTypeData);
			
			console.log(data)
			var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
	    	var donutData        = {
	     	 labels: [
	          '體驗類',
	          '採收類',
	          '文藝類',
	          '綜合類',
	      	],
	      	datasets: [
	      	  {
		          data: data,
		          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef'],
		        }
		      ]
		    }
		    var donutOptions     = {
		      maintainAspectRatio : false,
		      responsive : true,
		    }
		    //Create pie or douhnut chart
		    // You can switch between pie and douhnut using the method below.
		    var donutChart = new Chart(donutChartCanvas, {
		      type: 'doughnut',
		      data: donutData,
		      options: donutOptions
		    })	
		},
	error:function(){
		alert('url'+url);
		}
	});



	var data = [];
	var ctx = document.getElementById("stackedBarChart");
	console.log(ctx);
	$.post({
		url: "${pageContext.request.contextPath}/monthlyActTypeSales.do",
// 		datatype: "json",
		success:function(response,status){
			const dataOne= response.monActTypeSalesOne
			const dataTwo= response.monActTypeSalesTwo
			const dataThree= response.monActTypeSalesThree
			const dataFour= response.monActTypeSalesFour
			const options= response.month

		     var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')


		     var stackedBarChart = new Chart(stackedBarChartCanvas, {
		    	 type: 'bar',
		    	  data: {
		    	    labels: options,
		    	    datasets: [{
		    	      label: '體驗類',
		    	      backgroundColor: "#f56954",
		    	      data: dataOne,
		    	    }, {
		    	      label: '採收類',
		    	      backgroundColor: "#00a65a",
		    	      data: dataTwo,
		    	    }, {
		    	      label: '文藝類',
		    	      backgroundColor: "#f39c12",
		    	      data: dataThree,
		    	    }, {
		    	      label: '綜合類',
		    	      backgroundColor: "#00c0ef",
		    	      data: dataFour,
		    	    }],
		    	  },
		    	options: {
		    	    tooltips: {
		    	      displayColors: true,
		    	      callbacks:{
		    	        mode: 'x',
		    	      },
		    	    },
		    	    scales: {
		    	      xAxes: [{
		    	        stacked: true,
		    	        gridLines: {
		    	          display: false,
		    	        }
		    	      }],
		    	      yAxes: [{
		    	        stacked: true,
		    	        ticks: {
		    	          beginAtZero: true,
		    	        },
		    	        type: 'linear',
		    	      }]
		    	    },
		    	    responsive: true,
		    	    maintainAspectRatio: false,
		    	    legend: { position: 'bottom' },
		    	  }
		     })
			}
		})







		



	
		
})

// $.fetch("${pageContext.request.contextPath}/actAnalysisType.do")
// .then((response)=>{
// 	console.log(response);
// })




//   $(function () {
//     /* ChartJS
//      * -------
//      * Here we will create a few charts using ChartJS
//      */

//     //--------------
//     //- AREA CHART -
//     //--------------

//     // Get context with jQuery - using jQuery's .get() method.
//     var areaChartCanvas = $('#areaChart').get(0).getContext('2d')

//     var areaChartData = {
//       labels  : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
//       datasets: [
//         {
//           label               : 'Digital Goods',
//           backgroundColor     : 'rgba(60,141,188,0.9)',
//           borderColor         : 'rgba(60,141,188,0.8)',
//           pointRadius          : false,
//           pointColor          : '#3b8bba',
//           pointStrokeColor    : 'rgba(60,141,188,1)',
//           pointHighlightFill  : '#fff',
//           pointHighlightStroke: 'rgba(60,141,188,1)',
//           data                : [28, 48, 40, 19, 86, 27, 90]
//         },
//         {
//           label               : 'Electronics',
//           backgroundColor     : 'rgba(210, 214, 222, 1)',
//           borderColor         : 'rgba(210, 214, 222, 1)',
//           pointRadius         : false,
//           pointColor          : 'rgba(210, 214, 222, 1)',
//           pointStrokeColor    : '#c1c7d1',
//           pointHighlightFill  : '#fff',
//           pointHighlightStroke: 'rgba(220,220,220,1)',
//           data                : [65, 59, 80, 81, 56, 55, 40]
//         },
//       ]
//     }

//     var areaChartOptions = {
//       maintainAspectRatio : false,
//       responsive : true,
//       legend: {
//         display: false
//       },
//       scales: {
//         xAxes: [{
//           gridLines : {
//             display : false,
//           }
//         }],
//         yAxes: [{
//           gridLines : {
//             display : false,
//           }
//         }]
//       }
//     }

//     // This will get the first returned node in the jQuery collection.
//     var areaChart       = new Chart(areaChartCanvas, {
//       type: 'line',
//       data: areaChartData,
//       options: areaChartOptions
//     })

//     //-------------
//     //- LINE CHART -
//     //--------------
//     var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
//     var lineChartOptions = $.extend(true, {}, areaChartOptions)
//     var lineChartData = $.extend(true, {}, areaChartData)
//     lineChartData.datasets[0].fill = false;
//     lineChartData.datasets[1].fill = false;
//     lineChartOptions.datasetFill = false

//     var lineChart = new Chart(lineChartCanvas, {
//       type: 'line',
//       data: lineChartData,
//       options: lineChartOptions
//     })

    //-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
//     var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
//     var donutData        = {
//       labels: [
//           '體驗類',
//           '採收類',
//           '文藝類',
//           '綜合類',
//       ],
//       datasets: [
//         {
//           data: [700,500,400,600,300,100],
//           backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
//         }
//       ]
//     }
//     var donutOptions     = {
//       maintainAspectRatio : false,
//       responsive : true,
//     }
//     //Create pie or douhnut chart
//     // You can switch between pie and douhnut using the method below.
//     var donutChart = new Chart(donutChartCanvas, {
//       type: 'doughnut',
//       data: donutData,
//       options: donutOptions
//     })

    //-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
//     var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
//     var pieOptions     = {
//       maintainAspectRatio : false,
//       responsive : true,
//     }
//     //Create pie or douhnut chart
//     // You can switch between pie and douhnut using the method below.
//     var pieChart = new Chart(pieChartCanvas, {
//       type: 'pie',
//       data: pieData,
//       options: pieOptions
//     })

    //-------------
    //- BAR CHART -
    //-------------
//     var barChartCanvas = $('#barChart').get(0).getContext('2d')
//     var barChartData = $.extend(true, {}, areaChartData)
//     var temp0 = areaChartData.datasets[0]
//     var temp1 = areaChartData.datasets[1]
//     barChartData.datasets[0] = temp1
//     barChartData.datasets[1] = temp0

//     var barChartOptions = {
//       responsive              : true,
//       maintainAspectRatio     : false,
//       datasetFill             : false
//     }

//     var barChart = new Chart(barChartCanvas, {
//       type: 'bar',
//       data: barChartData,
//       options: barChartOptions
//     })

    //---------------------
    //- STACKED BAR CHART -
    //---------------------
//     var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')
//     var stackedBarChartData = $.extend(true, {}, barChartData)

//     var stackedBarChartOptions = {
//       responsive              : true,
//       maintainAspectRatio     : false,
//       scales: {
//         xAxes: [{
//           stacked: true,
//         }],
//         yAxes: [{
//           stacked: true
//         }]
//       }
//     }

//     var stackedBarChart = new Chart(stackedBarChartCanvas, {
//       type: 'bar',
//       data: stackedBarChartData,
//       options: stackedBarChartOptions
//     })
//   })
</script>
</body>
</html>