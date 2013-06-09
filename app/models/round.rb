 class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  def correct_percentage
    p "#{self.guesses.where(is_correct: true).count / self.deck.cards.length.to_f * 100}%"
  end

end
