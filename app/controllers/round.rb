
# get /round/:round_id |round_id|
#   params
  
#   Round.create()

# end

def to_js(card)
    {question: (erb :_question, :layout => false),
    answer: (erb :_answer, :layout => false)}.to_json
end

get '/rounds' do
  deck_id = params[:deck_id]
  round = Round.create(user_id: session[:id], deck_id: @deck_id)
  session[:deck_id] = deck_id
  session[:round_id] = round.id  
  erb :round
end

get '/rounds/card_order' do

  # session[:round_id] = round.id
  # @card = Card.find(session[:cards].pop)
  # deck_id = Round.find(session[:round_id]).deck_id
  Deck.find(session[:deck_id]).cards.map { |card| card.id }.shuffle.to_json
end

get '/rounds/get_question' do
    @card = Card.find(params[:card_id])
    erb :_question, :layout => false
end

post '/rounds/submit_guess' do
  @card = Card.find(params[:card_id])
  Guess.create(round_id: session[:round_id], is_correct: @card.correct?(params[:guess]), card_id: @card.id)
  erb :_answer, :layout => false
end


# post '/rounds' do
#   p session
#   content_type :json

#   card = Card.find(params[:card_id])

#   Guess.create(round_id: session[:round_id], card_id: card.id, 
#                is_correct: card.correct?(params[:guess]))

#   @card = Card.find(session[:cards].pop)
#   if @card
#     {question: (erb :_question, :layout => false),
#     answer: (erb :_answer, :layout => false)}.to_json
#   else
#     ## game is over
#   end
# end
