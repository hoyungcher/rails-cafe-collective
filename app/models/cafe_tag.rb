class CafeTag < ApplicationRecord
  belongs_to :cafe
  belongs_to :tag

  validates :cafe, presence: true
  validates :tag, presence: true
end
