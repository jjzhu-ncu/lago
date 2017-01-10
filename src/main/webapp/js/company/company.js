$(document).ready(function() {
	getNeedByPos();
	getKind();
	getPosCountByDateAndFncStage();
	getPosPubTime();
	posPubCountByCityAndDate();
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
		var detailData = [];
		
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

function getPosPubTime(){
	$.ajax({
		type: 'POST',
		url: 'rest/company/posPubCountByHour/',
		data: JSON.stringify({
		}),
		success: function(result){
			var data = result['data'];
			var hour = [];
			var count = [];
			for(var i =0; i<data.length;i++){
				hour[i] = data[i]['h']+'时';
				count[i] = data[i]['count'];
			}
			var myChart = echarts.init(document.getElementById("pubCountTime"));



			option = {
					title: {
						x: 'center',
						text: '职位发布时间分布',
						subtext: 'position publish time',

					},
					tooltip: {
						trigger: 'item'
					},
					toolbox: {
						show: true,
						feature: {
							dataView: {show: true, readOnly: false},
							restore: {show: true},
							saveAsImage: {show: true}
						}
					},
					calculable: true,
					grid: {
						borderWidth: 0,
						y: 80,
						y2: 60
					},
					xAxis: [
					        {
					        	type: 'category',

					        	show: true,
					        	data: hour
					        }
					        ],
					        yAxis: [
					                {
					                	type: 'value',
					                	show: false
					                }
					                ],
					                series: [
					                         {
					                        	 name: '职位发布时间分布',
					                        	 type: 'bar',
					                        	 itemStyle: {
					                        		 normal: {
					                        			 color: function(params) {
					                        				 // build a color map as your need.
					                        				 var colorList = [
					                        				                  '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
					                        				                  '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
					                        				                  '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0',
					                        				                  '#D6506B','#B5E379','#14E801','#24105C','#A362A0',
					                        				                  '#A5C314', '#D87C25', '#C87C25', '#187C25','#887C25',
					                        				                  ];
					                        				 return colorList[params.dataIndex]
					                        			 },
					                        			 label: {
					                        				 show: true,
					                        				 position: 'top',
					                        				 formatter: '{c}'
					                        			 }
					                        		 }
					                        	 },
					                        	 data: count

					                         }
					                         ]
			};
			myChart.setOption(option);

		},
		dataType : "json",
		contentType : "application/json"
	}
	);
}
function posPubCountByCityAndDate(){
	$.ajax({
		type : 'POST',
		url : 'rest/company/posPubCountByCityAndDate/',
		data : JSON.stringify({
			time: '2016-11-11'
		}),
		success : function(result) {
			var myChart = echarts.init(document.getElementById("pubCountCityAndDate"));
			
			var returnData = result['data'];
			var allTime = [];
			var cityMap = {};
			var allCity = [];
			var mySeries = [];
			for(var i = 0 ; i < returnData.length ; i ++){
				allTime.push(returnData[i].h);
				if(cityMap[returnData[i].city] == undefined){
					allTime.push(returnData[i].h);
					cityMap[returnData[i].city] = [];
					
				}
				
				
				cityMap[returnData[i].city].push( [returnData[i].h, returnData[i].count]);
			}
			
			for(var c in cityMap){
				allCity.push(c);
				mySeries.push(
						{
				            name:c,
				            type:'scatter',
				            data: cityMap[c],
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        }
				);
				
			}

			option = {
				    
				    tooltip : {
				        trigger: 'axis',
				        showDelay : 0,
				        formatter : function (params) {
				        	if (params.value.length > 1) {
				                return params.seriesName + ' :<br/>'
				                   + params.value[0] + '时 ' 
				                   + params.value[1] + '个 ';
				            }
				            else {
				                return params.seriesName + ' :<br/>'
				                   + params.name + ' : '
				                   + params.value + ' 个 ';
				            }
				        },  
				        axisPointer:{
				            show: true,
				            type : 'cross',
				            lineStyle: {
				                type : 'dashed',
				                width : 1
				            }
				        }
				    },
				    legend: {
				        data:allCity
				    },
				    xAxis : [
				        {
				            type : 'value',
				            scale:true,
				            axisLabel : {
				                formatter: '{value}'
				            }
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            scale:true,
				            axisLabel : {
				                formatter: '{value} '
				            }
				        }
				    ],
				    series : mySeries
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
			drawPosCountByPie(result);
			drawPosCountByBrokenLine(result);
		},
		dataType : "json",
		contentType : "application/json"

	});
}