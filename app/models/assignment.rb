class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true
  
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
#    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.correct_answers_sum += correct_answers.where(id: answer_ids).count
    save!
  end 

  def completed?
    current_question.nil?
  end

  def percent_of
    (correct_answers_sum / all_correct_answers.to_f * 100.0).to_i
  end
  
  def success?
    percent_of > 85
  end
  
  def progress_percent
   ((test.questions.index(current_question) + 1) / test.questions.count.to_f * 100.0).round
  end

  private
  
  def before_validation_set_first_question
    self.current_question = test.questions.first if current_question.nil?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def all_correct_answers
    Answer.correct.includes(:question).where(questions: {test_id: test.id}).count
  end
  
  def correct_answers
    current_question.answers.correct
  end
  
#  def correct_answer?(answer_ids)
#    correct_answers.count == correct_answers.where(id: answer_ids).count && correct_answers.count == answer_ids.count
#  end
  
  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end


end
