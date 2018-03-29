 
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  validates :email, :first_name, presence: true
  validates_uniqueness_of :email

  has_many :gists
  has_many :assignments
  has_many :tests, through: :assignments
  has_many :created_tests,  class_name: "Test"


  def tests_for_user(level)
    self.tests.where(level: level)
  end
  
  def test_passage(test)
    assignments.order(id: :desc).find_by(test_id: test.id)
  end

end
