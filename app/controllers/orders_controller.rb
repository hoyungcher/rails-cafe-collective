class OrdersController < ApplicationController
  def new
    @order = Order.new()
    @menu_item = MenuItem.find(params[:id])
    @booking = Booking.find(params[:booking_id])
    @cafe = Cafe.find(params[:cafe_id])
  end

  def create
    @order = Order.new(order_params)
    @menu_item = MenuItem.find(params[:id])
    @booking = Booking.find(params[:booking_id])
    @cafe = Cafe.find(params[:cafe_id])
    @order.menu_item = @menu_item
    @order.booking = @booking
    @order.save

    redirect_to cafe_user_booking_path(@cafe, @booking.user, @booking)
  end

  private

  def order_params

  end
end
