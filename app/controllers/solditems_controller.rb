class SolditemsController < ApplicationController
  def index
    # @items = Item.select { |item| item.status == 1 }
    @items = Item.select { |item| item.user_id == current_user.id && item.status == 1 }
  end
end
