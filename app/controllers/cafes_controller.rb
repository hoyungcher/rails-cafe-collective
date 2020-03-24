class CafesController < ApplicationController
  def index
    if params[:query].present?
      @cafes = Cafe.search_by_name(params[:query])
    else
      @cafes = Cafe.all
    end
  end

  def show
    @cafe = Cafe.find(params[:id])
    @markers = [{lat: @cafe.latitude, lng: @cafe.longitude}]
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

  private

  def cafe_params
    params.require(:cafe).permit(:name, :description, :neighbourhood, :address, :city, :category, :contact)
  end
end
