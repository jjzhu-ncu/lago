$(document).ready(function() {
	getData();
	
});


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
	        }
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

