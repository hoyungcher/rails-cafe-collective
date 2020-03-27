class Bookmark < ApplicationRecord
  belongs_to :cafe
  belongs_to :user

  validates :cafe, presence: true
  validates :user, presence: true, uniqueness: { scope: :cafe, message: "should only have one cafe for each user" }
end
