class User < ApplicationRecord
  validates :name, presence: true

  has_many :assignments
  has_many :tests, through: :assignments
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  def tests_for_user(level)
    self.tests.where(level: level)
  end
  
  def test_passage(test)
    assignments.order(id: :desc).find_by(test_id: test.id)
  end
end
