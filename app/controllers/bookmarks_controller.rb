class BookmarksController < ApplicationController
  def create
    cafe = Cafe.find(params[:cafe_id])
    Bookmark.create(user: current_user, cafe: cafe)

    respond_to do |format|
      format.json  { render :json => {message: 'OK'} }
    end
  end

  def index
    @unshow_menu_bar = false
    @user = current_user
    @bookmarks = @user.bookmarks
  end

  def destroy
  end
end
