class Item < ApplicationRecord
  validates :name, :explanation, :condition, :postage, :area, :day,:price,presence: true
  validates :name, length: { maximum: 40}
  validates :explanation, length: { maximum: 1000}
  validates :brand, length: { maximum: 40}
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }

  belongs_to :user
  belongs_to :category
  has_one :solditem, dependent: :destroy
  has_many :itemimages, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :itemimages

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  # SELECT * FROM item ORDER BY created_at DESC;
  # item = Item.all.order(created_at: "DESC")
  default_scope -> { order(created_at: :desc)}
  
end
