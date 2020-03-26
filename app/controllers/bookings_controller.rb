class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
    @cafe = Cafe.find(params[:cafe_id])
    @hourly_slots = get_hourly_seats(@cafe, Date.today)
  end

  def create
    @user = User.find(params[:user_id])
    @data = params["booking"].split(",")
    @booking = Booking.new(user: @user, date: Date.today, start_time: @data[0].to_i, duration: @data[1].to_i)
    @booking.save
    @cafe = Cafe.find(params[:cafe_id])
    @booking.duration.times do |index|
      @booked_hour = BookedHour.new(booking: @booking, hourly_slot: HourlySlot.where( "date = ? AND start_time = ? AND cafe_id = ?", Date.today, @booking.start_time + index, @cafe.id).first, paid: true)
      @booked_hour.save
    end
    redirect_to user_bookings_path(@user)
  end

  def index
    @user = current_user
    @bookings = @user.bookings.uniq
    @cafe = Cafe.where(user: current_user).first
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
