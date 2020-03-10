class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :solditem, dependent: :destroy
  has_many :itemimages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
