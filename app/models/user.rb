class User < ApplicationRecord

  has_many :tests

  def tests_for_user(level)
    Test.where(level: level)
  end
end
