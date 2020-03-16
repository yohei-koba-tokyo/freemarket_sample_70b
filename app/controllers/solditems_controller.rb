class SolditemsController < ApplicationController
  def index
    @items = Item.select { |item| item.status == 1 }
  end
end
