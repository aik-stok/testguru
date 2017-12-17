class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|

      t.string :body, null: false
      t.boolean :correct, default: false
      t.timestamps
    end
  end
end
