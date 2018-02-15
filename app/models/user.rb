require 'digest/sha1'

class User < ApplicationRecord

  has_many :assignments
  has_many :tests, through: :assignments
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  has_secure_password

  def tests_for_user(level)
    self.tests.where(level: level)
  end
  
  def test_passage(test)
    assignments.order(id: :desc).find_by(test_id: test.id)
  end

end
