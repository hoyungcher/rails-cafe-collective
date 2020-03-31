class BookingsController < ApplicationController
  def new
    @show_booking_bar = true
    @unshow_back_to_cafe = false
    @booking = Booking.new
    @user = User.find(params[:user_id])
    @cafe = Cafe.find(params[:cafe_id])
    @hourly_slots = get_hourly_seats(@cafe, Date.today).to_a.sort {|a,b| a[0].to_i <=> b[0].to_i}
    @user_bookings = Booking.where(user: @user, date: Date.today).uniq
  end

  def create
    @cafe = Cafe.find(params[:cafe_id])
    @user = User.find(params[:user_id])
    @data = params["booking"].split(",")
    @test_booking = Booking.where("date = ? AND user_id = ? AND start_time = ?", Date.today, @user, @data[0].to_i )
    if @test_booking
      @test_booking.destroy_all
    end
    @booking = Booking.new(user: @user, date: Date.today, start_time: @data[0].to_i, duration: @data[1].to_i)
    @cafe = Cafe.find(params[:cafe_id])
    if @booking.save
      @booking.duration.times do |index|
        @booked_hour = BookedHour.new(booking: @booking, hourly_slot: HourlySlot.where( "date = ? AND start_time = ? AND cafe_id = ?", Date.today, @booking.start_time + index, @cafe.id).first, paid: true)
        @booked_hour.save
      end
    end
    @booking.total_credits = (@booking.duration * @booking.booked_hours.first.hourly_slot.price_per_hour)
    @booking.save
    redirect_to user_bookings_path(@user)
  end

  def index
    @unshow_menu_bar = false

    @user = current_user
    if @user.owner
      @bookings = []
      Cafe.where(user: @user).each do |cafe|
        if cafe || cafe.bookings
          cafe.bookings.uniq.each do |booking|
            @bookings << booking
          end
        end
      end
    @bookings = @bookings.sort_by {|booking| booking.start_time}
    else
      @bookings = @user.bookings.uniq
    end
    @cafe = Cafe.where(user: current_user).first
    @cafes = Cafe.where(user: current_user)
  end

  def show
    @user = current_user
    @unshow_menu_bar = false
    @unshow_order_bar == false
    @unshow_back_to_cafe = false

    @booking = Booking.find(params[:id])
    @order = Order.new()
    @cafe = Cafe.find(params[:cafe_id])
  end

  def get_hourly_seats(cafe, date)
    new_hash = {}
    cafe.hourly_slots.where(date: date).each do |slot|
      new_hash["#{slot.start_time}"] = slot.total_seats
    end
    new_hash
  end

  def check_in
    @booking = Booking.find(params[:id])
    @booking.active = true
    @booking.save
    @cafe = Cafe.find(params[:cafe_id])
    redirect_to cafe_user_booking_path(@cafe, current_user, @booking)
  end
end
