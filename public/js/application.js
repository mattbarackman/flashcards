// Could you put these somewhere else so they aren't in the global scope?

// Perhaps an object literal that has startRound and questionRequest on it?
var order;
var card_counter = 0;
var user_id;


function startRound() {
  $.ajax({
      url: "/rounds/card_order",
      method: "GET"
    }).done(function(response){
      // If you set the content_type in your request or your route JQuery does
      // this for you.
      order = $.parseJSON(response); //set order to shuffled array of indices [5, 1, 3, ...]
    }).done(
      // Nice! Passing the questionRequest function as a callback :D
      questionRequest
    );
};

function questionRequest(){
  if (card_counter == order.length) {
    window.location.href = '/decks'
  }
  else {
    $.ajax({
        url: "/rounds/get_question",
        method: "GET",
        data: "card_id=" + order[card_counter]
      }).done(function(response){
        $('.question').html(response).fadeIn();
      });
    }
  }

$(document).ready(function() {

  // Pull these callbacks into named functions and it will make this much more
  // readable.

  $('.question').on('submit','form',function(e){
    e.preventDefault();
    $('.question').fadeOut();
    $.ajax({
      url: "/rounds/submit_guess",
      method: "POST",
      data: $(this).serialize()
    }).done(function(response){
      $('.question').html(response).fadeIn();
      card_counter++;
      setTimeout(function () {
        // Holy nested callbacks batman!
        $('.question').fadeOut();
        questionRequest();
      }, 2000);

    });
  });
});
