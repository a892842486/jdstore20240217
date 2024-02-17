class Product < ApplicationRecord
  mount_uploader :image, ImageUploader #讓上傳圖片功能 在 專案內生效
end
