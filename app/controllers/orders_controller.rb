class OrdersController < ApplicationController
  def new
    @order = Order.new()
    @menu_item = MenuItem.find(params[:id])
    @booking = Booking.find(params[:booking_id])
    @cafe = Cafe.find(params[:cafe_id])
  end

  def create
    @order = Order.new()
    @menu_item = MenuItem.find_by_name(params["order"]["menu_item"])
    @booking = Booking.find(params[:booking_id])
    @order.menu_item = @menu_item
    @order.booking = @booking
    @order.save!

    # @booking.remaining_credits = @booking.remaining_credits - @menu_item.price
    # @booking.save

    @cafe = @order.menu_item.cafe
    redirect_to cafe_user_booking_path(@cafe, @booking.user, @booking)
  end

  private

  # def order_params
  #   params.require(:order).permit(:menu_item, :booking)
  # end
end
