class Estimate < ApplicationRecord
  belongs_to :customer
  belongs_to :user

  validates :item_name,     presence: true
  validates :selling_price, presence: true
end
