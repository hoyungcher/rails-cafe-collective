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
    (ratings.length == 0) ? @rating = 0 : @rating = ratings.sum / ratings.length
    @empty_stars = 5 - @rating
  end

  def new
    @cafe = Cafe.new()
  end

  def create
    cafe = params[:cafe]
    @cafe = Cafe.new(name: cafe["name"], description: cafe["description"], neighbourhood: cafe["neighbourhood"], address: cafe["address"], city: cafe["city"], category: cafe["category"], contact: cafe["contact"])
    @cafe.user = current_user

    if @cafe.save
      @ambience = params["tags"]
      @ambience.each do |ambience|
        tag = Tag.where(name: ambience).first
        CafeTag.create!(tag: tag, cafe: @cafe)
      end

      @amenities = params["amenities"].split(", ")
      @amenities.each do |amenity|
        tag_arr = Tag.where(name: amenity)
        if tag_arr.empty?
          tag = Tag.create!(tag_category: "amenity", name: amenity)
        else
          tag = tag_arr.first
        end
        CafeTag.create!(tag: tag, cafe: @cafe)
      end
      redirect_to dashboard_path(@cafe)
    else
      render :new
    end
  end

  def edit
    @cafe = Cafe.find(params[:id])
    amenities = CafeTag.where(cafe:Cafe.first).filter {|cafetag| cafetag.tag.tag_category == "amenity"}
    @amenities = []
    amenities.each do |amenity|
      @amenities << amenity.tag.name
    end
  end

  def update
    @cafe = Cafe.find(params[:id])
    @cafe.user = current_user

    if @cafe.update!(cafe_params)
      @ambience = params["tags"]
      CafeTag.where(cafe: @cafe).destroy_all
      @ambience.each do |ambience|
        tag = Tag.where(name: ambience).first
        CafeTag.create!(tag: tag, cafe: @cafe)
      end

      @amenities = params["amenities"].split(", ")
      @amenities.each do |amenity|
        tag_arr = Tag.where(name: amenity)
        if tag_arr.empty?
          tag = Tag.create!(tag_category: "amenity", name: amenity)
        else
          tag = tag_arr.first
        end
        CafeTag.create!(tag: tag, cafe: @cafe)
      end
      redirect_to cafe_path(@cafe)
    else
      render :edit
    end
  end

  def destroy
    @cafe = Cafe.find(params[:id])
    @cafe.destroy
    redirect_to dashboard_path(current_user)
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings.uniq
    @cafe = Cafe.where(user: current_user).first
    @cafes = Cafe.where(user: current_user)
  end

  def analytics
    @bookings = Cafe.where(user: current_user).first.bookings.filter{|book| book.date < Date.today}.sort{|booking| booking.date}.reverse
    @menu_items = Cafe.where(user: current_user).first.menu_items
    @item_hash = {}
    @menu_items.each do |item|
      price = item.price
      order_count = item.orders.count
      @item_hash["#{item.name}"] = price * order_count
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name, :description, :neighbourhood, :address, :city, :category, :contact)
  end
end
