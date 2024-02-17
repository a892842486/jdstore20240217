class Product < ApplicationRecord
  mount_uploader :image, ImageUploader #讓上傳圖片功能 在 專案內生效

  scope :recent, -> { order('created_at DESC') }
  scope :higher_price, -> { order('price DESC') }
  scope :lower_price, -> { order('price ASC') }
end
