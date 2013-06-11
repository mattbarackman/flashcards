get '/rounds' do
  # I would recommend not working directly with sessions in your routes.
  # For instance, create a current_user helper so you don't have to
  # know exactly how your session is formatted.

  @user = User.find(session["user"]) if session["user"]
  deck_id = params[:deck_id]
  round = Round.create(user_id: session["user"], deck_id: deck_id)

  session[:deck_id] = deck_id

  # If your round belongs_to a deck, could you just keep track of the round_id?
  # Then you could have a current_round helper that returns a round object so
  # you don't have to munge between integers and rounds in your routes

  session[:round_id] = round.id
  erb :round
end

get '/rounds/card_order' do
  # This feels like it should be a class on the deck instance, i.e.
  # Deck.find(session[:deck_id]).randomized_card_ids.to_json

  Deck.find(session[:deck_id]).cards.map { |card| card.id }.shuffle.to_json
  # Also, you should tell say what type of content your sending.
  # By calling `content_type :json`

end

get '/rounds/get_question' do
    @card = Card.find(params[:card_id])
    erb :_question, :layout => false
end

post '/rounds/submit_guess' do
  @card = Card.find(params[:card_id])

  # current_round.guesses.create(is_correct: @card.correct?(params[:guess], # :card => @card) 
  # is functionally equivalent.
  guess = Guess.create(round_id: session[:round_id], is_correct: @card.correct?(params[:guess]), card_id: @card.id)

  @correct = guess.is_correct

  # What if instead of having an if in your _answer template, you rendered
  # different templates based on if the answer was correct or not?

  erb :_answer, :layout => false
end
