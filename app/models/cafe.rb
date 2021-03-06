class Cafe < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :cafe_tags, dependent: :destroy
  has_many :tags, through: :cafe_tags
  has_many :hourly_slots, dependent: :destroy
  has_many :booked_hours, through: :hourly_slots
  has_many :bookings, through: :booked_hours
  has_many :bookmarks, dependent: :destroy
  has_many :menu_items, dependent: :destroy
  has_many :orders, through: :menu_items

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :neighbourhood, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :category, presence: true
  validates :contact, presence: true, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  end
