class MenuItem < ApplicationRecord
  belongs_to :cafe
  has_many :orders, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :cafe,
    message: "should only have one of each item on your menu" }
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: %w(food drink),
    message: "%{value} is not a valid category" }
  validates :price, presence: true
end
