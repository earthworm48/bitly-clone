$(document).ready(function(){
	$(".b5").hover(function(){
		$(this).css("background-color","#DEB887");
		},function(){
		$(this).css("background-color","transparent");
		// $(this).fadeIn(500);
	});

	$("#submit_btn").click(function(){
		alert( "Thanks for choosing Shortify!!" );
	});

	$( "#error-btn" ).click(function() {
	  $( "#error-message" ).toggle( "slow" );
	});

});

