class Cafe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :neighbourhood, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :category, presence: true
  validates :contact, presence: true, uniqueness: true
end

# Cafe.create(user: User.find(User.first.id + 5), name: "Kevan's Restaurant",
#   description: "nice korean food and stuff",
#   neighbourhood: "East", address: "31 Amber Gardens, Singapore", city: "Singapore", category: "cafe", contact: "98921302")
