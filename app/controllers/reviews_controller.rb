class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:booking_id])
    @cafe = @booking.booked_hours.first.hourly_slot.cafe

    @unshow_menu_bar = false
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:booking_id])
    @cafe = @booking.booked_hours.first.hourly_slot.cafe
    @review.user = @user
    @review.cafe = @cafe
    @review.save

    redirect_to(cafe_path(@cafe))
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
