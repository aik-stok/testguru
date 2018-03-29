class Test < ApplicationRecord

  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, numericality: { only_integer: true }
  validates :category, presence: true

  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", :foreign_key => 'user_id'
  has_many :questions
  has_many :assignments
  has_many :users, through: :assignments

  scope :easy, -> {where(level: 0..1)}
  scope :intermediate, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}
  scope :from_category, -> (name)  {joins(:category).where("categories.title = ? ", name)}
  
  def self.category_titles(name)
    from_category(name).order("tests.title DESC").pluck(:title)
  end

end
