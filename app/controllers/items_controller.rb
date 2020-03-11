class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    4.times { @item.itemimages.build }
  end

  def create
    Item.create(item_params)
  end


  private
  def item_params
    params.require(:item).permit(:name,:explanation,:category,:brand,:condition,:postage,:area,:day,:price,itemimages_attributes: [:image]).merge(user_id:1)
  end

end

