class CreateCreations < ActiveRecord::Migration[5.0]
  def change
    create_table :creations do |t|

      t.belongs_to :user
      t.belongs_to :test
      t.timestamps
    end
  end
end
