class HomeController < ApplicationController
  def index
    @items = Item.includes(:itemimages).select { |item| item.status == 1 }.first(3)
    @brand_items = Item.includes(:itemimages).select { |item| item.status == 1 && item.brand == "ユニクロ" }.first(3)
    @parents = Category.where(ancestry: nil)
  end
end