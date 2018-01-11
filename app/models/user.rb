class User < ApplicationRecord

  has_many :assignments
  has_many :tests, through: :assignments
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  def tests_for_user(level)
    self.tests.where(level: level)
  end
end
