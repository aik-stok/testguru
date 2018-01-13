class Answer < ApplicationRecord
  validates :body, presence: true
  validate :max_quantity, on: :create

  def max_quantity
    if  self.question.answers.size >= 4 
      errors.add("You cannot have more than 4 answers.")
    end
  end

  belongs_to :question
  scope :correct, -> {where(correct: true)}
end
