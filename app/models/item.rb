class Item < ApplicationRecord
  def view_name_and_purchase_price
    self.name + " (仕入れ価格: #{self.purchase_price.to_s}円)"
  end

  validates :name,           presence: true
  validates :purchase_price, presence: true
end