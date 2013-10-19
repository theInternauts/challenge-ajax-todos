$(document).ready(function(){
	var form_handler = function(e){
		e.preventDefault();
		$.ajax({
			type: this.method,
			url: this.action,
			dataType: 'json',
			data: "task=" + $('#form_new_tasks #new_todo_task')[0].value
		}).done(function(response){
			console.log("AJAX, Yo!");
			console.log(response);
			$('.available-todos').append(create_form({template: 'available-todos',data: response}));
			var new_node = '.available-todos #todo-' + response.id
			$(new_node).on('submit', form_handler );
		}).fail(function(response){
			console.log("failed......");
			console.log(response);
		});

	};

	$('#form_new_tasks').on('submit', form_handler );
	$('.available-todos form').on('submit',function(e){
		console.log("task completed");
		e.preventDefault();
		$.ajax({
			type: this.method,
			url: this.action,
			dataType: 'json',
			data: ""
		}).done(function(response){
			console.log("Completed: AJAX, Son!");
			console.log(response);
			var item = '.available-todos #todo-' + response.id;
			console.log(item);
			$(item).remove();
		}).fail(function(response){
			console.log("completion failed......");
			console.log(response);
		});
	});

	var create_form = function(obj){
		new_obj = obj;
		var new_template = "";
		if (new_obj.template == "available-todos"){
			new_template = '<div id="todo-' + new_obj.data.id + '">' + new_obj.data.task + ' <form method="POST" action="/todos/' + new_obj.data.id + '/complete"><button>Complete!</button></form></div>';	
		}
		else if (new_obj.template == "completed-todos"){
			new_template = '<li id="' + new_obj.data.id +'">' + new_obj.data.task + "</li>";
		} else {
			new_template = "DOM template for task id: " + new_obj.data.id + " not found.";
		}
		return new_template;
	};

});

// {"id":18,"task":null,"status":"available","created_at":"2013-10-19T02:48:42Z","updated_at":"2013-10-19T02:48:42Z"}

// <div id="todo-<%=todo.id%>"><%=todo.task%>
//       <form method="POST" action="/todos/<%=todo.id%>/complete">
//         <button>Complete!</button>
//       </form>
//     </div>

// var b = '<div id="todo-' + new_obj.data.id + '">' + new_obj.data.task + '<form method="POST" action="/todos/' + new_obj.data.id + '/complete"><button>Complete!</button></form></div>';





