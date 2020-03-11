class HomeController < ApplicationController
  def index
    @items = []
    vvv = []
    @bland_items = []
    zzz = []

    Item.all.each do |i|
      if i.status == 1
        vvv << i
      end
    end

    Item.all.each do |i|
      if i.status == 1 && i.brand == "ユニクロ"
        zzz << i
      end
    end

    i = 0
    vvv.reverse_each do |value|
      i += 1
      @items << value
      break if i == 3
    end

    zzz.reverse_each do |value|
      i += 1
      @bland_items << value
      break if i == 3
    end 
  end
end