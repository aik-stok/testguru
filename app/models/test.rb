class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :assignments
  has_many :users, through: :assignments

  
  scope :from_category, -> (name)  {joins("JOIN categories ON tests.category_id = categories.id").where("categories.title = ? ", name).order("tests.title DESC").pluck(:title)}

end
