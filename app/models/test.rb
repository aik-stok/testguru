class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :assignments
  has_many :users, through: :assignments

  scope :easy, -> {where(level: 0..1)}
  scope :intermediate, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5...Float::INFINITY)}
  scope :from_category, -> (name)  {joins("JOIN categories ON tests.category_id = categories.id").where("categories.title = ? ", name).order("tests.title DESC").pluck(:title)}

end
