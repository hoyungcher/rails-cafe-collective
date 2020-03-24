class Tag < ApplicationRecord
  has_many :cafe_tags

  validates :tag_category, presence: true, inclusion: { in: %w(ambience amenity),
    message: "%{value} is not a valid category" }
  validates :name, presence: true, uniqueness: true
end
