class AddUserIdToTests < ActiveRecord::Migration[5.0]
  def change
    add_reference :tests, :user, index: true
    add_foreign_key :tests, :users, column: :user_id
  end
end
