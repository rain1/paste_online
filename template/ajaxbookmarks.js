$(document).ready(function() {
	$('<iframe id="float" src="#" style="position:absolute; top:20%; left:20%;  height:60%; width:60%; font-size:16px; font-weight:bold; color:#FFFFFF; background-color: #000000;"></iframe>').appendTo("body") ;
	$("#float").hide();
	
	  if (window.history && window.history.pushState) {

    window.history.pushState('forward', null, './#forward');

    $(window).on('popstate', function() {
      alert('Back button was pressed.');
    });

  }
	
});

function preview(elem){
	
	$('#float').attr('src', elem.href.replace("view","view2"));
	$( "#float" ).show();
}

$(document).keyup(function(e) {
	if(e.keyCode== 27) {
		$("#float").hide();
	}
});