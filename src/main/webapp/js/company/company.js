$(document).ready(function() {
	getNeedByPos();
	getKind();
	getPosCountByDateAndFncStage();
	
});
function getNeedByPos() {
	var kind="JAVA";
	if($("#kind").val()==null||$("#kind").val()==""){
		kind="JAVA"
	}else{
		kind =$("#kind").val();
	}
	$.ajax({
		type : 'POST',
		url : 'rest/company/getByCmpFncStage/',
		data : JSON.stringify({
			kind:kind,
			//p.city,p.companySize,p.financeStage ,p.industryField
			//stage:"初创型(未融资)",
			//companySize:"companySize"
		}),
		success : function(result) {
			var myChart = echarts.init(document.getElementById("cmpStage"));
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
						data : [ kind ]
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

function drawPosCountByBrokenLine(result){
	var myChart = echarts.init(document.getElementById("brokenLine"));
	var data = result['data'];
	var sub_data = data.slice(data.length - 15, data.length-1);
	var stageCount = [];
	var allTime = [];
	var mySeries = [];
	for(var i = 0 ;i< allStages.length; i++){
		stageCount[i] = [1];
	}

	for(var i=0; i < sub_data.length; i ++){
		allTime[i] = sub_data[i].time;
		var detail = sub_data[i].detail;
		var detailData = [];
		for(var j = 0; j < detail.length; j++){
			stageCount[detail[j].stage-1][i] = detail[j].count;

		}
	}
	
	for(var i = 0; i < stageCount.length ; i ++){
		mySeries[i] = {
	        	 name:allStages[i],
	        	 type:'line',
	        	 stack: '总量',
	        	 data:stageCount[i]
	         }
	}
	
	option = {
			tooltip: {
				trigger: 'axis'
			},
			legend: {
				data:allStages
			},
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			toolbox: {
				feature: {
					saveAsImage: {}
				}
			},
			xAxis: {
				type: 'category',
				boundaryGap: false,
				data: allTime
			},
			yAxis: {
				type: 'value'
			},
			series: mySeries
	};

	myChart.setOption(option);
}

function drawPosCountByPie(result){
	var myChart = echarts.init(document.getElementById("timeCount"));
	var data = result['data'];
	var mySeries = [];
	var allTime = [];
	var allStage = [];
	var update = 0;
	for(var i=0; i < data.length; i ++){
		allTime[i] = data[i].time;
		var detail = data[i].detail;
		var detailData = []
		if(detail.length > allStage.length){
			update = 1;
		}
		for(var j = 0; j < detail.length; j++){
			detailData[j]= {value: detail[j].count, name: allStages[detail[j].stage-1]};
			if(update){
				allStage[j] = allStages[detail[j].stage-1];
			}
		}
		update = 0;
		mySeries[i] = {
				series : [
				          {
				        	  name:'融资类型',
				        	  type:'pie',
				        	  data:detailData
				          }
				          ]
		};
	}
	var myOptions = [];
	myOptions[0] = {

			tooltip : {
				trigger: 'item',
				formatter: "{a} <br/>{b} : {c} ({d}%)"
			},
			legend: {
				data:allStage
			},
			series: mySeries[0].series
	};
	for(var i = 1; i<mySeries.length;i++){
		myOptions[i] = mySeries[i];
	}

	option = {
			timeline : {
				data : allTime,
				label : {
					formatter : function(s) {
						return s.slice(0, 7);
					}
				}
			},
			options: myOptions
	};
	myChart.setOption(option);
}

function getPosCountByDateAndFncStage(){

	$.ajax({
		type : 'POST',
		url : 'rest/company/getPosCountByDateAndFncStage/',
		data : JSON.stringify({
			//kind:kind,
			//p.city,p.companySize,p.financeStage ,p.industryField
			//stage:"初创型(未融资)",
			//companySize:"companySize"
		}),
		success : function(result) {
			drawPosCountByPie(result);
			drawPosCountByBrokenLine(result);
		},
		dataType : "json",
		contentType : "application/json"

	});
}