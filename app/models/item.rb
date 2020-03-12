class Item < ApplicationRecord
  validates :name, :explanation, :condition, :postage, :area, :day,:price,presence: true

  belongs_to :user
  belongs_to :category
  has_one :solditem, dependent: :destroy
  has_many :itemimages, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :itemimages

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
