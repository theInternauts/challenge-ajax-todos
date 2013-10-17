$(document).ready(function(){

  $('#add-todo').on('click', function(e){
    e.preventDefault();
    console.log("in click");
    $.ajax({
      type:$(this).attr('post'),
      url:$(this).attr('action')
      })
    .done(function(response){
        console.log(JSON.parse(response));
        $('.available-todos').append("<li>" + JSON.parse(response).name + "</li>")
        })
    .fail(function(){
      console.log("fail");
    });
  });
});