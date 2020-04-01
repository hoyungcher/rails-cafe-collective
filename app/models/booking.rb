class Booking < ApplicationRecord
  belongs_to :user
  has_many :booked_hours, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: [:start_time, :user],
    message: "should happen once per year" }
  validates :start_time, presence: true
  validates :duration, presence: true
  monetize :total_credits_cents

  def x_credits
    (total_credits_cents / 100) - orders.map(&:menu_item).map(&:price).sum
  end
end


    # t.date "date"
    # t.integer "start_time"
    # t.integer "duration"
    # t.string "special_requests"
    # t.integer "total_credits"
    # t.integer "remaining_credits"
