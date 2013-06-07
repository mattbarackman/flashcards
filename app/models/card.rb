class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses


  def correct?(guess)
    self.answer == guess
  end

  def to_json
    {question: (erb :_question, :layout => false),
    answer: (erb :_answer, :layout => false)}.to_json
  end
  
end
