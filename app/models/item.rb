class Item < ApplicationRecord
  belongs_to :user
  has_one :solditem, dependent: :destroy
  has_many :itemimages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
end
