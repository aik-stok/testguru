class AddCompletionToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :completed, :boolean, default: false
  end
end
