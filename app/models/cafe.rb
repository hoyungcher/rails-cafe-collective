class Cafe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :neighbourhood, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :category, presence: true
  validates :contact, presence: true, uniqueness: true
end
