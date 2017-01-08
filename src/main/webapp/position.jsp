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
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  	<div class="main-wrapper">		
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="toolbar.jsp"></jsp:include>
		<div class="content-wrapper">
		    <section class="content-header">
		      <h1>Position<small>analysis</small></h1>
		      <ol class="breadcrumb">
		        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		        <li class="active">Position</li>
		      </ol>
		    </section>
		    <section class="content">
		    	<div class="row">
		    	<div class="col-xs-12">
		    		作为程序员 每个职位的需求是什么样子的呢？ 
		    	</div>
		    	</div>
		    	<div class="row">
			    	<div class="col-xs-6">
	          			<div class="box box-primary">
	            			<div class="box-header with-border">
		              			<i class="fa fa-bar-chart-o"></i>
		              			<h3 class="box-title">Interactive Area Chart</h3>
		              			<div class="box-tools pull-right">各个职位统计
					            	<div class="btn-group" id="realtime" data-toggle="btn-toggle">
					                  <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
					                  <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
					                </div>
					            </div>
	            			</div>
	           				<div class="box-body">
	              				<div id="interactive" style="height: 500px;"></div>
	            			</div>
	          			</div>
	       			 </div>	
	       			 <div class="col-xs-6">
	          			<div class="box box-primary">
	            			<div class="box-header with-border">
		              			<i class="fa fa-bar-chart-o"></i>
		              			<h3 class="box-title">Interactive Area Chart</h3>
		              			<div class="box-tools pull-right">各个职位统计
					            	<div class="btn-group" id="realtime" data-toggle="btn-toggle">
					                  <button type="button" class="btn btn-default btn-xs active" data-toggle="on">On</button>
					                  <button type="button" class="btn btn-default btn-xs" data-toggle="off">Off</button>
					                </div>
					            </div>
	            			</div>
	           				<div class="box-body">
	              				<div id="avgSalary" style="height: 500px;"></div>
	            			</div>
	          			</div>
	       			 </div>			    	
		    	</div>
		    	<div class="row">
		    		<div class="col-xs-12">
	          			<div class="box box-primary">
	            			<div class="box-header with-border">
		              			<i class="fa fa-bar-chart-o"></i>
		              			<h3 class="box-title">地图</h3>
					            <div class="col-xs-2 input-group input-group-sm" style="float:right">
					                <select id="kind" class="form-control select2"></select>
					                    <span class="input-group-btn">
					                      <button type="button" class="btn btn-info btn-flat" onclick="getPosByCity()">Go!</button>
					                    </span>
					             </div>	
	            			</div>
	           				<div class="box-body">
	              				<div id="map" style="height: 600px;"></div>
	            			</div>
	          			</div>
	       			 </div>	    	
		    	</div>
		    	<!-- <div class="row">
		    		<div class="col-xs-12">
	          			<div class="box box-primary">
	            			<div class="box-header with-border">
		              			<i class="fa fa-bar-chart-o"></i>
		              			<h3 class="box-title">各个职位在各个城市的分布情况</h3>
					            <div class="col-xs-2 input-group input-group-sm" style="float:right">
					                <select id="kind" class="form-control select2"></select>
					                    <span class="input-group-btn">
					                      <button type="button" class="btn btn-info btn-flat" onclick="getPosByCity()">Go!</button>
					                    </span>
					             </div>	
	            			</div>
	           				<div class="box-body">
	              				<div id="line" style="height: 600px;"></div>
	            			</div>
	          			</div>
	       			 </div>	    	
		    	</div> -->
		    	
		    </section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>

<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="dist/js/app.min.js"></script>
<script src="plugins/echarts/echarts.js"></script>
<script src="js/city.js"></script>
<script src="js/position.js"></script>
<script>
$(document).ready(function() {
	getPosNum();
});


function getPosNum(){
	$.ajax({
		  type: 'POST',
		  url: 'rest/position/getPosNum/',
		  data:JSON.stringify({
			  //p.city,p.companySize,p.financeStage ,p.industryField
			  //city:"city",
			  //companySize:"companySize"
			}),
		  success: function(result){
			 // alert(result)
		  },
		  dataType: "json",
		  contentType:"application/json"
	});
}
</script>

</body>
</html>