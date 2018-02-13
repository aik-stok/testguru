class AddCorrectQuestionsToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :correct_questions, :integer
  end
end
