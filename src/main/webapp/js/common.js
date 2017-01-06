function getKind(){
	$.ajax({
		type: 'POST',
		url: 'rest/position/getPosKind/',
		data:JSON.stringify({
		}),
		success: function(result){
			//alert(result)
			var list =result.data;
			var optionstring = "";
			for(var i=0;i<list.length;i++){
				optionstring += "<option value=\"" + list[i] + "\" >" + list[i] + "</option>"; 
			}
			$("#kind").html("<option value=''>请选择...</option> "+optionstring);
		},
		dataType: "json",
		contentType:"application/json"
	});
}