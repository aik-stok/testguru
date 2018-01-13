class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|

      t.belongs_to :category, index: true
      t.string :title, null: false, unique: true
      t.integer :level, default: 0
      t.timestamps
    end
  end
end
