$(document).ready(function(){
	$('#form_new_tasks').on('submit', function(e){
		e.preventDefault();
		$.ajax({
			type: this.method,
			url: this.action,
			data: $('this').serialize()
		}).done(function(response){
			console.log("AJAX, Yo!");
			$('.available-todos').append(response);
		}).fail(function(response){
			console.log(response);
		});

	});
	$('.available-todos form').on('submit',function(e){
		console.log("task completed");
	});

	var create_form = function(obj){
		new_obj = obj;

		return new_obj;
	};

});

