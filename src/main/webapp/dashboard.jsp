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
<script src="js/dashboard.js"></script>
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

<script>
function getAll(){
	var kind = $("#kind").val();
	var place=$("#place").val();
	var s;
	$.ajax({
		  type: 'POST',
		  url: 'rest/position/getAll/',
		  data:JSON.stringify({
			  kind:kind,
			  place:place
			}),
		  success: function(result){
			  var resultList =result.data;
			  var tableDatas=[];//保存表数据
				for(var i = 0;i<resultList.length; i++){
			        tableDatas[i]={
							'id':i+1,
							'positionName':resultList[i].positionName,
							'companyFullName':resultList[i].companyFullName,
							'companySize':resultList[i].companySize,
							'education':resultList[i].education,
							'salary':resultList[i].salary,
							'workYear':resultList[i].workYear,
							'city':resultList[i].city,
							'industryField':resultList[i].industryField,
							'financeStage':resultList[i].financeStage
						};	
				}
				initTable2('positionTable',tableDatas);
		  },
		  dataType: "json",
		  contentType:"application/json"
	});
}

function initTable2(elem,tableDatas){
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) { $($.fn.dataTable.tables(true)).DataTable().columns.adjust(); });
	var tableDatas=tableDatas;
	var lengthMenu;
	lengthMenu=[10];
	buttons= [
        /* 'copy', 'csv', 'excel', 'pdf' */
    ];
	table=$("#positionTable").DataTable({
		dom: 'Bfrt<"pageclass"p><"infoclass"i>',
		buttons:buttons,
        sScrollX: "100%",   //表格的宽度
		scrollX:true,//设置滚动
		scollY:true,//设置滚动
		destroy: true,
		retrieve:true,
		ordering: true,
		searching: true,//开启搜索
        info: false,//是否显示左下角信息
        bLengthChange: true, //改变每页显示数据数量
        autoWidth: true,//自动宽度
		pagingType: "full",
		orderFixed:true,//高亮排序的列
		"lengthMenu": lengthMenu,
		stripeClasses: [ 'strip1', 'strip2' ],
		columns: [
			{ title:"编号","data": "id" , "className": "dt-center"},
			{ title:"职位名称","data": "positionName" , "className": "dt-center"},
			{ title:"公司名称","data": "companyFullName" , "className": "dt-center" },
			{ title:"公司规模","data": "companySize" , "className": "dt-center" },
			{ title:"教育水平","data": "education" , "className": "dt-center" },
			{ title:"薪资范围","data": "salary" , "className": "dt-center" },
			{ title:"工作经验","data": "workYear" , "className": "dt-center" },
			{ title:"城市","data": "city" , "className": "dt-center" },
			{ title:"服务领域","data": "industryField" , "className": "dt-center" },
			{ title:"融资情况","data": "financeStage" , "className": "dt-center" }
		],
		data: tableDatas,
		language: {
			info: "显示第 _PAGE_ 页，一共 _PAGES_ 页",
			emptyTable: "无数据",
			zeroRecords:    "无匹配结果",
			paginate: {
				first:      "首页",
				previous:   "上一页",
				next:       "下一页",
				last:       "尾页"
			}
		}		
    });
}
</script>
</body>
</html>