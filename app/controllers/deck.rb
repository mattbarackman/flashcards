get '/decks' do
  @decks = Deck.all
  # This should be extracted to a current_user helper
  @user = User.find(session["user"]) if session["user"]
  if @user
    erb :decks
  else
    redirect '/'
  end
end


# DEAD CODE! KILL IT! KILL IT WITH FIRE!
# post '/decks' do

# end
