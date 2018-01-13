class Category < ApplicationRecord
  validates :title, presence: true

  has_many :tests
  scope :by_name, -> {order("categories.title ASC")}
end
