class MenuItemsController < ApplicationController
  def index
    @cafe = Cafe.find(params[:cafe_id])
    @menu_items = @cafe.menu_items
    @menu_item = MenuItem.new
  end

  def create
  end

  def destroy
  end
end
