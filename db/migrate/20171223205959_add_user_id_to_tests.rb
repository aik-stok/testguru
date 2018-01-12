class AddUserIdToTests < ActiveRecord::Migration[5.0]
  def change
    add_reference :tests, :author, foreign_key: true
  end
end
