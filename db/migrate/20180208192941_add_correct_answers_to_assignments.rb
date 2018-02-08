class AddCorrectAnswersToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :correct_answers_sum, :integer, default: '0'
  end
end
