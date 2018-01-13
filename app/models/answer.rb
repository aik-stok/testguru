class Answer < ApplicationRecord
  belongs_to :question
  
  validates :body, presence: true
  validate :validate_max_quantity

  scope :correct, -> {where(correct: true)}

  private

  def validate_max_quantity
    if  question.answers.size >= 4 
      errors.add(:quantity, "You cannot have more than 4 answers.")
    end
  end
end
