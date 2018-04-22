class RemoveCorrectQuestionsFromAssignments < ActiveRecord::Migration[5.1]
  def change
    remove_column :assignments, :correct_questions
  end
end
