
# get /round/:round_id |round_id|
#   params
  
#   Round.create()

# end

def to_js(card)
    {question: (erb :_question, :layout => false),
    answer: (erb :_answer, :layout => false)}.to_json
end

get '/rounds' do
  round = Round.create(user_id: session[:id], deck_id: params[:deck_id])
  session[:cards] = Deck.find(params[:deck_id]).cards.shuffle
  session[:round_id] = round.id
  @card = Card.find(session[:cards].pop)
  erb :round
end

post '/rounds' do
  p session
  content_type :json

  card = Card.find(params[:card_id])

  Guess.create(round_id: session[:round_id], card_id: card.id, 
               is_correct: card.correct?(params[:guess]))

  @card = session[:cards].pop
  if @card
    {question: (erb :_question, :layout => false),
    answer: (erb :_answer, :layout => false)}.to_json
  else
    ## game is over
  end
end
