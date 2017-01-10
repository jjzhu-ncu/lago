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
