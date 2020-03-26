class Booking < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :start_time, presence: true, uniqueness: { scope: :date,
    message: "should not have two multiple bookings on the same day" }
  validates :duration, presence: true
end


    # t.date "date"
    # t.integer "start_time"
    # t.integer "duration"
    # t.string "special_requests"
    # t.integer "total_credits"
    # t.integer "remaining_credits"
