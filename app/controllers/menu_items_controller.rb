class MenuItemsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @cafe = Cafe.find(params[:cafe_id])
    @menu_items = @cafe.menu_items
    @menu_item = MenuItem.new
  end

  def create
    @user = User.find(params[:user_id])
    @cafe = Cafe.find(params[:cafe_id])
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.cafe = @cafe
  end

  def destroy
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :category, :price)
  end
end
