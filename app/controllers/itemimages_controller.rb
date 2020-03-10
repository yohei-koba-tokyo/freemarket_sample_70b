class ItemimagesController < ApplicationController

  # def new
  #   @itemimages = Itemimage.new
    # binding.pry
  # end

  def create
    
    Itemimage.create(image_params)
  end

  # private
  # def image_params
  #   params.require(:itemimage).permit(:image).merge(item_id:1)
    
  # end

end
