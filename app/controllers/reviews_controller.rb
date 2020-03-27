class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    redirect_to()
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end


  # create_table "reviews", force: :cascade do |t|
  #   t.bigint "user_id"
  #   t.bigint "cafe_id"
  #   t.string "content"
  #   t.integer "rating"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["cafe_id"], name: "index_reviews_on_cafe_id"
  #   t.index ["user_id"], name: "index_reviews_on_user_id"
  # end
