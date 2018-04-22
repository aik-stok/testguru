class AddRuleToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :rule, :integer
  end
end
