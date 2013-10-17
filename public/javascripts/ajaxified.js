$(document).ready(function(){
  $("#new_todo").on("submit", function(e){
    e.preventDefault();
    var newTask = $(this).serialize();

    $.ajax({
      type: $(this).attr("method"),
      url: $(this).attr("action"),
      data: newTask
    }).done(function(){
      console.log("new task: " + newTask);
    }).fail(function(){
      console.log("failed");
    });

  });
});
