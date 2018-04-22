class CreateBadgeAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :badge_assignments do |t|

      t.belongs_to :user
      t.belongs_to :badge
      t.timestamps
    end
  end
end
