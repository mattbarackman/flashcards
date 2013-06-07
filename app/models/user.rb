class User < ActiveRecord::Base
	validates :username, :password, presence: true
	validates :username, uniqueness: true

  has_many :decks, :through => :rounds
  has_many :rounds
end
