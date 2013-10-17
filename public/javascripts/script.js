$(document).ready(function() {
	$('form#new_todo').on('submit', function(e) {
		e.preventDefault();
		console.log("add todo intercepted!");

		$.ajax({
			type: this.method,
			url: this.action,
			data: $(this).serialize(),

		}).done(function(server_data) {
			console.log("WE ARE DONE");
			console.log(server_data);
			$('.available-todos').append(JSON.parse(server_data).task);
		}).fail(function(jqXHR, textStatus, errorThrown) {
			console.log("WE ARE FAILING");
		});
	});
});