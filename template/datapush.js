var arr =[];
var timestamp = '0';

function getData(){
	//alert(timestamp);
	$.ajax({
	url:"./latest.php?t="+timestamp,
	async:true,
	cache:false,

	success:function(result){

		//alert("ptsi: "+request_uri);

		var obj = $.parseJSON(result);
		for (key in obj) {
			if(key=='timestamp'){
				timestamp = obj[key];
			}else{
				arr[arr.length] = '<li><a class="bright" onmouseover="preview(this);" href="./?a=view&id='+obj[key]['id']+'" >'+obj[key]['title']+'</a><br>['+obj[key]['language']+'] '+obj[key]['created']+"</li>";
			}
		}
		for(elem in arr){
			$("#target").append(arr[elem]);
		}
		arr =[];
		//window.history.pushState({}, "", request_uri);
		setTimeout("getData()",1000);
	},

	error: function(){
	    //alert("server down");
		setTimeout("getData()",15000);
	}

	});
}

$(document).ready(function() {
	getData();
});