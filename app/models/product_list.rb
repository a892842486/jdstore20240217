class ProductList < ApplicationRecord
  belongs_to :order
  
  t.integer :order_id
  t.string :product_name
  t.integer :product_price
  t.integer :quantity
end
