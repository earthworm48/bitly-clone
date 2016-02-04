$(document).ready(function(){
	$(".url").hover(function(){
		$(this).css("background-color","#DEB887");
		},function(){
		$(this).css("background-color","transparent");
		// $(this).fadeIn(500);
	});

	// $("#submit_btn").click(function(){
	// 	alert( "Thanks for choosing Shortify!!" );
	// });
	$("#long_url").click(function(){
		$(this).css("border-color","red");
	});

	$( "#error-btn" ).click(function() {
	  $( "#error-message" ).toggle( "slow" );
	});

	// $( "#target" ).submit(function( event ) {
	//   alert( "Submitting form" );
	//   event.preventDefault();
	// });
	
	// $("#target").submit(function(){
	// 	event.preventDefault();
	// 	$.post("/urls",$(this).serialize(),function(response){
	// 		$("#url-table").append(response); // add the string in html form as a row to the form 
	// 	});
	// });
	//ajax is used so that the action will ONLY BE DONE when the action is SUCCESS;


	$("#target").submit(function(e) {
		
		// var url = "path/to/your/script.php"; // the script where you handle the form input.
	    $.ajax({
	           
	           type: "POST",
	           url: "/urls",
	           data: $("#target").serialize(), // serializes the form's elements.
	           
	           success: function(response)
	           {	
	           		
	               $("#url-table").prepend(response); // show response from the php script.		
	           	   $('#long_url').val('');
	           	   //debugger
	           	   if (response.length === 0){
	           	   	//debugger
	           	   	  $('#error-block').show();
	           	      $('#error-block').html("It is not a valid url!");
	           	   }
 				   
	           },

	         });

	    e.preventDefault(); // avoid to execute the actual submit of the form.
	});
});

