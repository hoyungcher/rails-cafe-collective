class Booking < ApplicationRecord
  belongs_to :user
  has_many :booked_hours, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: [:start_time, :user],
    message: "should happen once per year" }
  validates :start_time, presence: true
  validates :duration, presence: true
end


    # t.date "date"
    # t.integer "start_time"
    # t.integer "duration"
    # t.string "special_requests"
    # t.integer "total_credits"
    # t.integer "remaining_credits"
