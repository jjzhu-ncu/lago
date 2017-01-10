$(document).ready(function() {
	getData();
	getPosPubTime();
});
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

function getData(){
	$.ajax({
		  type: 'POST',
		  url: 'rest/position/getASByComSize/',
		  data:JSON.stringify({
			}),
		  success: function(result){
			  //alert(result)
			  var list =result.data;
			  var xData=list.companySizes;
			  var yData=list.kinds;
			  var ls=list.result;
			  var data=[];
			  for(var i=0;i<ls.length;i++){
				  var item=[ls[i].kind,ls[i].companySize,ls[i].total]
				  data[i]=item;
			  }
			  
			  
			  initBubble("bubble1",xData,yData,data);
			  initPie("pie1");
		  },
		  dataType: "json",
		  contentType:"application/json"
	});
}

function initPie(elem){
	var myChart = echarts.init(document.getElementById(elem));
	option = {
		    title : {
		        text: '需求量',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['Java','Python','PHP','C++','.NET','Hadoop']
		    },
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:0.5827, name:'Java'},
		                {value:0.0409, name:'Python'},
		                {value:0.1786, name:'PHP'},
		                {value:0.0963, name:'C++'},
		                {value:0.0877, name:'.NET'},
		                {value:0.0138, name:'Hadoop'}
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	myChart.setOption(option); 
}


function initBubble(elem,xData,yData,data){
	var myChart = echarts.init(document.getElementById(elem));
	var hours = xData;
	var days = yData;
	option = {
	    tooltip: {
	        position: 'top'
	    },
	    title: [],
	    singleAxis: [],
	    series: []
	};

	echarts.util.each(days, function (day, idx) {
	    option.title.push({
	        textBaseline: 'middle',
	        top: (idx + 0.5) * 100 / 7 + '%',
	        text: day
	    });
	    option.singleAxis.push({
	        left: 150,
	        type: 'category',
	        boundaryGap: false,
	        data: hours,
	        top: (idx * 100 / 7 + 5) + '%',
	        height: (100 / 7 - 10) + '%',
	        axisLabel: {
	            interval: 2
	        },
	    	text: hours
	    });
	    option.series.push({
	        singleAxisIndex: idx,
	        coordinateSystem: 'singleAxis',
	        type: 'scatter',
	        data: [],
	        symbolSize: function (dataItem) {
	            return dataItem[1] * 0.001;
	        }
	    });
	});

	echarts.util.each(data, function (dataItem) {
	    option.series[dataItem[0]].data.push([dataItem[1], dataItem[2]]);
	});
	myChart.setOption(option);                    
}

