var request_uri = location.pathname + location.search;

$(document).ready(function() {
	$('<iframe id="float" src="#" style="position:fixed; top:20%; left:20%;  height:60%; width:60%; font-size:16px; font-weight:bold; color:#FFFFFF; background-color: #000000;"></iframe>').appendTo("body") ;
	$("#float").hide();
});

function preview(elem){
	$('#float').get(0).contentWindow.location.replace(elem.href.replace("view","view2"));
	$( "#float" ).show();
	window.history.replaceState({}, "", elem.href);
}

$(document).keyup(function(e) {
	if(e.keyCode== 27) {
		$("#float").hide();
		window.history.replaceState({}, "", request_uri);
	}
});