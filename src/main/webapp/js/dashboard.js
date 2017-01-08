$(document).ready(function() {
	getCity();
	getKind();
});

/**
 * 获取不同公司规模人才需求
 * @returns
 */
function getCountBySize(){
	$.ajax({
		  type: 'POST',
		  url: 'rest/company/getCountBySize/',
		  data:JSON.stringify({
			}),
		  success: function(result){
			  var list =result.data;
		  },
		  dataType: "json",
		  contentType:"application/json"
	});
}


function getCity(){
	$.ajax({
		  type: 'POST',
		  url: 'rest/position/getPosCity/',
		  success: function(result){
			  list =result.data;
			  var optionstring = "";
			  for(var i=0;i<list.length;i++){
				  optionstring += "<option value=\"" + list[i] + "\" >" + list[i] + "</option>"; 
			  }
			  $("#place").html("<option value='请选择'>请选择...</option> "+optionstring);
		  },
		  dataType: "json",
		  contentType:"application/json"
	});
}

function getKind(){
	$.ajax({
		  type: 'POST',
		  url: 'rest/position/getPosKind/',
		  success: function(result){
			  list =result.data;
			  var optionstring = "";
			  for(var i=0;i<list.length;i++){
				  optionstring += "<option value=\"" + list[i] + "\" >" + list[i] + "</option>"; 
			  }
			  $("#kind").html("<option value='请选择'>请选择...</option> "+optionstring);
		  },
		  dataType: "json",
		  contentType:"application/json"
	});
}


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
        /*'copy', 'csv', 'excel', 'pdf'*/
    ];
	table=$("#"+elem).DataTable({
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