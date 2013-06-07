enable :sessions

get '/' do
	erb :index
end

# create user
post '/users' do
	User.create(params[:user])
	redirect '/'
end

# create session
post '/sessions' do
	@user = User.authenticate(params[:user])
	if @user
		session["user"] = @user.id
		"HEY YOU LOGGED IN"
		redirect '/'
	else
		password = nil
		"YOU FAILED TO LOG IN"
	end
end


get '/logout' do
	session.clear
	puts "I logged out"
	redirect '/'
end

get '/decks' do

end