class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    binding.pry
    Item.create(item_params)
  end


  private
  def item_params
    params.require(:item).permit(:name,:explanation,:category,:brand,:condition,:postage,:area,:day,:price).merge(user_id:1)
  end

end

