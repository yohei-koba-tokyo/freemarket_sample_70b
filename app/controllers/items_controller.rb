class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end
  
  def show
    @item = Item.find(params[:id])
    @itemimages = @item.itemimages.all
  end
  
  def destroy
  end

  
end


