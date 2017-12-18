class User < ApplicationRecord

def tests_for_user(level)
  Test.where(level: level)
end
