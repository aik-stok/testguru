class User < ApplicationRecord

  has_many :assignments
  has_many :tests, through: :assignments
  has_many: :creations
  has_many :tests, through: :creations

  def tests_for_user(level)
    self.tests.where(level: level)
  end
end
