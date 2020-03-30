class OrdersController < ApplicationController
  def index
    @bookings = @user.bookings.uniq
    @orders = []
    @bookings.each do |booking|
      (@orders << booking.orders).flatten!
    end
  end

  def new
    @order = Order.new
  end

  def create
    @menu_item = MenuItem.find(params[:menu_item])
    @booking = Booking.find(params[:booking_id])
    @order = Order.new()
  end
end
