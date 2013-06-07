require 'faker'

30.times do |user|
	user_args = {}

	user_args[:username] = Faker::Internet.email
	user_args[:password] = Faker::Lorem.word

	User.create(user_args)
end