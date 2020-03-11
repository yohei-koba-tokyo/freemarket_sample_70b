class Itemimage < ApplicationRecord
  validates :image, presence:true

  belongs_to :item

  mount_uploader :image, ImageUploader
end
