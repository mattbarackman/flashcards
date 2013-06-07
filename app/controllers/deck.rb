get '/decks' do
  @decks = Deck.all
  erb :decks
end

post '/decks' do

end
