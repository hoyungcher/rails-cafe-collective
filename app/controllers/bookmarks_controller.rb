class BookmarksController < ApplicationController
  def create
    cafe = Cafe.find(params[:cafe_id])
    @bookmark = Bookmark.create(user: current_user, cafe: cafe)

    respond_to do |format|
      format.json  { render :json => {message: 'OK', bookmarkid: @bookmark.id} }
    end
  end

  def index
    @unshow_menu_bar = false
    @user = current_user
    @bookmarks = @user.bookmarks
  end

  def destroy
    cafe = Cafe.find(params[:cafe_id])
    @bookmark = Bookmark.where(user: current_user, cafe: cafe)
    respond_to do |format|
      format.json  { render :json => {message: 'Deleted'} }
    end
  end
end
