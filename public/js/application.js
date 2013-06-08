$(document).ready(function() {
  var order;
  var card_counter = 40;
  var user_id;

  function questionRequest(){ 
    if(card_counter == order.length)
      window.location.href = '/decks';
    else {
      $.ajax({
          url: "/rounds/get_question",
          method: "GET",
          data: "card_id=" + order[card_counter]
        }).done(function(response){
          $('.question').html(response);
        });
      }
    }
    
  $.ajax({
      url: "/rounds/card_order",
      method: "GET"
    }).done(function(response){
      order = $.parseJSON(response);
      console.log(order);
    }).done(
      questionRequest
    );


  $('.question').on('submit','form',function(e){
    console.log("in here");
    e.preventDefault();
    $.ajax({
      url: "/rounds/submit_guess",
      method: "POST",
      data: $(this).serialize()
    }).done(function(response){
      $('.question').html(response);
      card_counter++;
      setTimeout(questionRequest, 2000);
      });
    });



  // var card_index
  // $('.question').on('submit', 'form', function(e){
  //   console.log("this should not run");
  //   e.preventDefault();
  //   $.ajax({
  //     url: "/rounds",
  //     method: "POST",
  //     data: $(this).serialize()
  //   }).done(function(response){
  //     console.log(response);
  //     $('.question').html(response.answer);
  //     setTimeout(function(){
  //       $('.question').html(response.question);
  //     }, 2000);
  //   });
  // });
});
