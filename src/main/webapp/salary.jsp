<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>拉钩招聘信息数据可视化</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
  <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="dist/js/app.min.js"></script>
<script src="plugins/echarts/echarts.js"></script>
<script src="js/salary.js"></script>
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  	<div class="main-wrapper">		
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="toolbar.jsp"></jsp:include>
		<div class="content-wrapper">
		    <section class="content-header">
		      <h1>Salary<small>analysis</small></h1>
		      <ol class="breadcrumb">
		        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		        <li class="active">Salary</li>
		      </ol>
		    </section>
		    <section class="content">
		    	
		    	<!-- tab1 -->
		    	<div class="row">
		    		<div class="col-xs-8">
	          			<div class="box box-primary">
	            			<div class="box-header with-border">
		              			<i class="fa fa-bar-chart-o"></i>
		              			<h3 class="box-title">不同公司规模的平均薪资如何</h3>
<!-- 					            <div class="col-xs-2 input-group input-group-sm" style="float:right">
					                <select id="kind" class="form-control select2"></select>
					                    <span class="input-group-btn">
					                      <button type="button" class="btn btn-info btn-flat" onclick="">Go!</button>
					                    </span>
					             </div>	 -->
	            			</div>
	           				<div class="box-body">
	              				<div id="bubble1" style="height: 400px;"></div>
	            			</div>
	          			</div>
	       			 </div>	 
	       			 <div class="col-xs-4">
	          			<div class="box box-primary">
	            			<div class="box-header with-border">
		              			<i class="fa fa-bar-chart-o"></i>
		              			<h3 class="box-title">不同职位需求量</h3>
	            			</div>
	           				<div class="box-body">
	              				<div id="pie1" style="height: 400px;"></div>
	            			</div>
	          			</div>
	       			 </div>	     
	       			 
	       			  	
		    	</div>
		    	<div class='row'>
						<div class="col-xs-12">
							<div class="box box-primary">
								<div class="box-header with-border">
									<i class="fa fa-bar-chart-o"></i>
									<h3 class="box-title">不同融资阶段每日的职位发布量</h3>
									
								</div>
								<div class="box-body">
									<div id="pubCountTime" style="height: 400px;"></div>
								</div>
							</div>
						</div>
					</div>
		    </section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>