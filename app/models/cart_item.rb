class CartItem < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, sources: :product
end
