class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses


  # If you moved this to a guess, a guess would know it's own card and
  # therefore would not need to receive a parameter.
  def correct?(guess)
    self.answer.downcase == guess.downcase
  end

end
