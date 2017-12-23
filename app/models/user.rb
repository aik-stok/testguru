class User < ApplicationRecord

  has_many :assignments
  has_many :tests, through: :assignments

  def tests_for_user(level)
    self.tests.where(level: level)
  end
end
