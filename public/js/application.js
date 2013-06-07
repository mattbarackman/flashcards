$(document).ready(function() {

  $('question').on('submit', 'form', function(e){
    e.preventDefault();
    $.ajax({
      url: "/rounds",
      method: "POST",
      data: $(this).serialize()
    }).done(function(response){
      $('.question').html(response);
    });
  });
});
