class Test < ApplicationRecord

  belongs_to :category
  has_many :questions

  def self.belongs_to_category(name)
    arr = []
    Category.find_by(title: name).tests.order('title DESC').each {|test|arr << test.title}
    arr
  end
end
