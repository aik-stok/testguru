class Test < ApplicationRecord

  belongs_to :category
  has_many :questions

  def self.tests_from_category(name)
    Test.joins("JOIN categories ON tests.category_id = categories.id").where("categories.title = ? ", name).order("tests.title DESC").tests.pluck(:title)
  end
end
