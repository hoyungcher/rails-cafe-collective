class Order < ApplicationRecord
  belongs_to :menu_item
  belongs_to :booking

  validates :menu_item, presence: true
  validates :booking, presence: true
end
