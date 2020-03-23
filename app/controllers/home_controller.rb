class HomeController < ApplicationController
  def index
    @items = Item.select { |item| item.status == 1 }.first(3)
    @brand_items = Item.select { |item| item.status == 1 && item.brand == "ユニクロ" }.first(3)
    @parents = Category.where(ancestry: nil)
  end
end