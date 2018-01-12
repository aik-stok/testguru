class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :assignments
  has_many :users, through: :assignments

  def self.tests_from_category(name)
    Test.joins("JOIN categories ON tests.category_id = categories.id").where("categories.title = ? ", name).order("tests.title DESC").tests.pluck(:title)
  end
end
