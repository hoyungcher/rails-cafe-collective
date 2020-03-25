class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
    @cafe = Cafe.find(params[:cafe_id])
    @hourly_slots = get_hourly_seats(@cafe, Date.today)
  end

  def create

  end

  def index
    @user = current_user
  end

  def show
  end

  def get_hourly_seats(cafe, date)
    new_hash = {}
    cafe.hourly_slots.where(date: date).each do |slot|
      new_hash["#{slot.start_time}"] = slot.total_seats
    end
    new_hash
  end

end
