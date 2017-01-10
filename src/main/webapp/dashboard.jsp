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
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
  <link href="extends/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet">
  
<script src="extends/jquery-1.9.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="dist/js/app.min.js"></script>

<script src="extends/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="extends/datatables/extensions/Buttons/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" charset="utf8" src="extends/datatables/extensions/Buttons/js/buttons.flash.min.js"></script>
<script type="text/javascript" charset="utf8" src="extends/datatables/extensions/Buttons/js/jszip.min.js"></script>
<script type="text/javascript" charset="utf8" src="extends/datatables/extensions/Buttons/js/pdfmake.min.js"></script>
<script type="text/javascript" charset="utf8" src="extends/datatables/extensions/Buttons/js/vfs_fonts.js"></script>

 <script type="text/javascript" charset="utf8" src="extends/datatables/extensions/Buttons/js/buttons.html5.min.js"></script>
<script type="text/javascript" charset="utf8" src="extends/datatables/extensions/Buttons/js/buttons.print.min.js"></script>
<script type="text/javascript" charset="utf8" src="extends/datatables/extensions/Buttons/js/buttons.colVis.min.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  	<div class="main-wrapper">		
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="toolbar.jsp"></jsp:include>
		<div class="content-wrapper">
		    <section class="content-header">
		      <h1>DashBoard<small>analysis</small></h1>
		      <ol class="breadcrumb">
		        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		        <li class="active">DashBoard</li>
		      </ol>
		    </section>
		    <section class="content">
      <!-- Info boxes -->
      <div class="row">
      	<div class="col-xs-12">
	         <div class="box box-primary">
	            <div class="box-header with-border">
		              <i class="fa fa-bar-chart-o"></i><h3 class="box-title">不同公司规模人才需求情况</h3>
	            </div>
	           	<div class="box-body">
	              	 <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="ion ion-ios-people-outline"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">15-50人</span>
              <span class="info-box-number">13227</span>
            </div>
          </div>
        </div>
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="ion ion-ios-people-outline"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">150-500人</span>
              <span class="info-box-number">13337</span>
            </div>
          </div>
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="ion ion-ios-people-outline"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">50-150人</span>
              <span class="info-box-number">14609</span>
            </div>
          </div>
        </div>
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">500-2000人</span>
              <span class="info-box-number">8196</span>
            </div>
          </div>
        </div>
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="ion ion-ios-people-outline"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">2000人以上</span>
              <span class="info-box-number">12575</span>
            </div>
          </div>
        </div>
        <div class="col-md-2 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="ion ion-ios-people-outline"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">少于15人</span>
              <span class="info-box-number">2691</span>
            </div>
          </div>
        </div>
	            </div>
	         </div>
	     </div>	     
      </div>

		    	<div class="row">
			    	<div class="col-xs-12">
	          			<div class="box box-danger">
	            			<div class="box-header with-border">
		              			<h3 class="box-title">检索条件</h3>		      
	            			</div>
	            			<div class="box-body">
									<div class="col-md-3">
					    			<div class="form-group" style="width: auto;">
					    				<label>城市</label>
					    				<select id="place" class="form-control select2" style="width:100%;"></select>
					    			</div>
					    		 </div>
					    		<div class="col-md-3">
					    			<div class="form-group" style="width: auto;">
					    			    <label>职位</label>
					    			      <select id="kind" class="form-control select2" style="width:100%;"></select>
					    			</div>
					    		</div>		    				    			
					    		<div class="col-md-12">
					    		   <button type="submit" class="btn btn-info pull-right" onclick="getAll()">查询</button>    
					    		</div>
						    </div>	
	          			</div>
	       			 </div>			    	
		    	</div>
		    	
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">招聘信息</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-wrench"></i></button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
		    	<div class="col-md-12">
                	<table id="positionTable" class="dataTable table-striped table-bordered table-condensed" style="width:100%; height:500px;">
					</table>
            	</div> 
		    </div>         
          </div>
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green"><i class="fa "></i> 100%</span>
                    <h5 class="description-header">64635</h5>
                    <span class="description-text">TOTAL JOB</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-yellow"><i class="fa "></i> 31.22%</span>
                    <h5 class="description-header">20180</h5>
                    <span class="description-text">TOTAL JAVA</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <span class="description-percentage text-green"><i class="fa "></i> 7.47%</span>
                    <h5 class="description-header">4827</h5>
                    <span class="description-text">TOTAL C</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block">
                    <span class="description-percentage text-red"><i class="fa "></i> 2.19%</span>
                    <h5 class="description-header">1418</h5>
                    <span class="description-text">GOAL PYTHON</span>
                  </div>
                  <!-- /.description-block -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>

<script src="js/dashboard.js"></script>
</body>
</html>