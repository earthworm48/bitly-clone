$(document).ready(function(){
	$(".url").hover(function(){
		$(this).css("background-color","#DEB887");
		},function(){
		$(this).css("background-color","transparent");
		// $(this).fadeIn(500);
	});

	$("#submit_btn").click(function(){
		console.log("Thanks for using Shortify");
	});
});