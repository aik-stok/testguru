class AddEmailColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string, null: false, default: ''
  end
end
