class AddDefaultValueToAssignments < ActiveRecord::Migration[5.1]
  def change
    change_column :assignments, :correct_questions, :integer, default: '0'
  end
end
