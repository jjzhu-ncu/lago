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
			var myChart = echarts.init(document.getElementById("timeCount"));
			var data = result['data']
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
					detailData[j]= {value: detail[j].count, name: detail[j].stage};
					if(update){
						allStage[j] = detail[j].stage;
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
					toolbox: {
						show : true,
						feature : {
							mark : {show: true},
							dataView : {show: true, readOnly: false},
							magicType : {
								show: true, 
								type: ['pie', 'funnel'],
								option: {
									funnel: {
										x: '25%',
										width: '50%',
										funnelAlign: 'left',
										max: 1700
									}
								}
							},
							restore : {show: true},
							saveAsImage : {show: true}
						}
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
		},
		dataType : "json",
		contentType : "application/json"

	});




}