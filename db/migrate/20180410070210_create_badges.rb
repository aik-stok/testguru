class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|

      t.string :title
      t.string :img_path
      t.timestamps
    end
  end
end
