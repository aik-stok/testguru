class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :gists,  :url
    add_index :tests, %i[title level]
    add_index :users, %i[first_name last_name]
  end
end
