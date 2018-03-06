class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|

      t.belongs_to :user, index: true
      t.belongs_to :question, index: true
      t.string :url, null: false
      t.timestamps
    end
  end
end
