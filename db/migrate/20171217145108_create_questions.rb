class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|

      t.belongs_to :test, index: true
      t.text :body, null: false
      t.timestamps
    end
  end
end
