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

allStages = ['初创型(未融资)', '初创型(天使轮)', '初创型(未融资)', '成长型(A轮)', 
      '成长型(B轮)', '成长型(不需要融资)','成熟型(C轮)' , '成熟型(D轮及以上)',
      '成熟型(不需要融资)', '上市公司' ];