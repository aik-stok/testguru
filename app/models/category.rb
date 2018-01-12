class Category < ApplicationRecord

  has_many :tests
  scope :by_name, -> {order("categories.title ASC")}
end
