class HourlySlot < ApplicationRecord
  belongs_to :cafe
  has_many :booked_hours, dependent: :destroy
end
