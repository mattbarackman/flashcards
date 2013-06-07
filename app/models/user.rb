class User < ActiveRecord::Base
  has_many :decks, :through => :rounds
  has_many :rounds
end
