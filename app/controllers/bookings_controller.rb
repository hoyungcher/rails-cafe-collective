class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
    @cafe = Cafe.find(params[:cafe_id])
  end

  def create
  end

  def index
    @user = current_user
  end

  def show
  end
end
