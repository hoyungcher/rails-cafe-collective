class CafesController < ApplicationController
  def index
    @unshow_banner = false
    @unshow_menu_bar = false

    if params[:address].present?
      @cafes = Cafe.near(params[:address], 1)
    # elsif params[:query].present?
    #   @cafes = Cafe.search_by_name(params[:query])
    else
      @cafes = Cafe.all
    end

    @user = current_user
    @bookmarks = @user.bookmarks.map(&:cafe_id)
    # raise
    @tags = Tag.where(tag_category: "ambience")
  end

  def show
    @user = current_user
    @unshow_action_bar = false
    @unshow_back_to_home = false
    @cafe = Cafe.find(params[:id])
    @markers = [{lat: @cafe.latitude, lng: @cafe.longitude}]
    ratings = []
    @cafe.reviews.each do |review|
      ratings << review.rating
    end
    @rating = ratings.sum / ratings.length
    @empty_stars = 5 - @rating
  end

  def new
    @cafe = Cafe.new()
  end

  def create
    @cafe = Cafe.new(cafe_params)
    @cafe.user = current.user

    if @cafe.save
      redirect_to cafe_path(@cafe)
    else
      render :new
    end
  end

  def edit
    @cafe = Cafe.find(params[:id])
  end

  def update
    @cafe = Cafe.find(params[:id])
    @cafe.user = current_user

    if @cafe.update(cafe_params)
      redirect_to cafe_path(@cafe)
    else
      render :edit
    end
  end

  def destroy
    @cafe = Cafe.find(params[:id])
    @cafe.destroy
    redirect_to user_bookings_path(current_user)
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name, :description, :neighbourhood, :address, :city, :category, :contact)
  end
end
