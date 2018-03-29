class AddCurrentQuestionRefToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_reference :assignments, :current_question
  end
end
