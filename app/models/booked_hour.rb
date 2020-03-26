class BookedHour < ApplicationRecord
  belongs_to :booking
  belongs_to :hourly_slot

  validates :booking, presence: true
  validates :hourly_slot, presence: true
  validates :paid, presence: true
end
