$(document).ready(function() {
  var order;
  var card_counter = 0;

   function questionRequest(){ $.ajax({
        url: "/rounds/get_question",
        method: "GET",
        data: "hello"
      }).done(function(response){
        console.log(response);
      });
    }

  $.ajax({
      url: "/rounds/card_order",
      method: "GET"
    }).done(function(response){
      order = response;
      console.log(order);
    }).done({
      questionRequest();
    });





  // $('.question').on('submit','form',function(e){
  //   e.preventDefault();
  //   $.ajax({
  //     url: "/rounds/submit_guess",
  //     method: "POST",
  //     data: $(this).serialize()
  //   }).done(function(){
  //     card_counter++;
  //   })
  // }


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
