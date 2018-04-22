class BadgeAssignment < ApplicationRecord

  belongs_to :user
  belongs_to :badge

  def check_all_rules(current_user, test_id)
    array = []
    array << 1 if current_user.assignments.where( test_id: test_id).count == 1
    array << 2 if (Test.from_category("Rails") - current_user.tests.includes(:assignments).where(assignments: {completed: true})).empty?
    array << 3 if (Test.intermediate - current_user.tests.intermediate.includes(:assignments).where(assignments: {completed: true})).empty?
    array
  end

end


