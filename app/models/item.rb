class Item < ApplicationRecord
  validates :name,           presence: true
  validates :purchase_price, presence: true

  has_many :estimates
end