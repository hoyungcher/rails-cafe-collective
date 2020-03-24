class BookedHour < ApplicationRecord
  belongs_to :booking
  belongs_to :hourly_slot
end
