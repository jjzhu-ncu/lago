<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>拉钩招聘信息数据可视化</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
</head>


<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="main-wrapper">
			<jsp:include page="header.jsp"></jsp:include>
			<jsp:include page="toolbar.jsp"></jsp:include>
			<div class="content-wrapper">
				<section class="content-header">
					<h1>
						Company<small>analysis</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
						<li class="active">Company</li>
					</ol>
				</section>
				<section class="content">
					<div class="row" >
						
					</div>
				</section>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>

	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="dist/js/app.min.js"></script>
	<script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			getPosNum();
		});

		function getPosNum() {
			$.ajax({
				type : 'POST',
				url : 'rest/company/getByCmpFncStage/',
				data : JSON.stringify({
				//p.city,p.companySize,p.financeStage ,p.industryField
				//stage:"初创型(未融资)",
				//companySize:"companySize"
				}),
				success : function(result) {
					var myChart = echarts.init(document.getElementById(1));
					var data = result['data'];
					var stages = new Array(data.length);
					var counts = new Array(data.length);
					for(var i = 0; i < data.length; i ++){
						stages[i] = data[i]['financeStage'];
						counts[i] = data[i]['total']
					}
					var option = {
						tooltip : {
							show : true
						},
						legend : {
							data : [ 'Java' ]
						},
						
						xAxis : [ {
							type : 'category',
							data : stages,
							axisLabel: {
								rotate: -30,
							}
						} ],
						yAxis : [ {
							type : 'value'
						} ],
						series : [ {
							"name" : "销量",
							"type" : "bar",
							"data" : counts
						} ]
					};
					myChart.setOption(option);
				},
				dataType : "json",
				contentType : "application/json"
			});
		}
	</script>
</body>
</html>