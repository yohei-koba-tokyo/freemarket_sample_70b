class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :purchase, :pay, :edit, :update, :destr]
  def index
  end

  def new
    @item = Item.new
    @item.itemimages.new
    @prefectures = prefectures
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    if  item_params["itemimages_attributes"] != nil
      item = Item.new(item_params)
      
      if item.save
        redirect_to @current_user
      else
        redirect_to action: 'new'
      end
    else
      redirect_to action: 'new'
    end
  end

  def edit
    @prefectures = prefectures
    @category = Category.find(@item.category_id)
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @category_child_array = @item.category.parent.parent.children
    @category_grandchild_array = @item.category.parent.children
  end

  def update
    if @item.update(item_params)
      redirect_to @current_user
    else
      redirect_to action: 'edit'
    end
  end

  def show
    @itemimages = @item.itemimages.all
    @category = Category.find(@item.category_id)
  end

  def destroy
    if @item.destroy
      redirect_to user_path(current_user)
    else
      redirect_to action: 'show'
    end
  end


  def purchase
    set_credit
    @address = Address.where(user_id: current_user.id).first
    @itemimages = @item.itemimages.all
    if @credit.blank?
    else
      # Payjp.api_key =ENV['PAYJP_SECRET_KEY']
      Payjp.api_key =Rails.application.credentials[:PAYJP_SECRET_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      #カード情報表示のためインスタンス変数に代入
      @credit_information = customer.cards.retrieve(@credit.card_id)
    end
    if @credit_information.present?
      @credit_brand = @credit_information.brand      
      case @credit_brand
        when "Visa"
          @credit_src = "visa.svg"
        when "JCB"
          @credit_src = "jcb.svg"
        when "MasterCard"
          @credit_src = "master-card.svg"
        when "American Express"
          @credit_src = "american_express.svg"
        when "Diners Club"
          @credit_src = "dinersclub.svg"
        when "Discover"
          @credit_src = "discover.svg"
      end
    end
  end

  def pay
    card = Credit.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    @item.update( status: 0)
    solditem = Solditem.new( item_id: params[:id], user_id: current_user.id )
    solditem.save

    redirect_to done_items_path(@item)
  end

  def done
  end

  def unsold

    @unsolditems = Item.select { |item| item.user_id == current_user.id && item.status == 1 && Item.all.order(created_at: "DESC") .page(params[:page]).per(5) } 
    @items = Item.select { |item| item.user_id == current_user.id }
  end

  

  def soldout
    @items = Item.select { |item| item.user_id == current_user.id && item.status == 0 }
    @itemsnum = Item.select { |item| item.user_id == current_user.id }
    @parents = Category.where(ancestry: nil)
  end

  def subshow
    @parents = Category.where(ancestry: nil)
    @items = Item.select { |item| item.status == 1 && item.category_id == params[:format]}

  end

  private
  def item_params

    if params["action"] == "create"
      item_array = params.require(:item).permit(:name,:explanation,:brand,:condition,:postage,:area,:day,:price,itemimages_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
      if params.require(:item).permit(:category1)["category1"] == "選択してください" or params.require(:category2) == "選択してください" or params.require(:category3) == "選択してください"
        item_array["category_id"] = ""
      else
        category1 = params.require(:item).permit(:category1)
        category2 = params.require(:category2)
        category3 = params.require(:category3)

        category1_id = Category.where(name: category1["category1"]).where(ancestry: nil).ids
        category2_id = Category.where("id>?",category1_id).where(name: category2).where.not("ancestry LIKE ?","%/%").ids
        category2_2_id = category2_id[0]
        category3_id = Category.where("id>?",category2_2_id).find_by(name: category3).id

        item_array["category_id"] = category3_id
      end
      
    elsif params["action"] == "update"
      
      item_array = params.require(:item).permit(:name,:explanation,:brand,:condition,:postage,:area,:day,:price,itemimages_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
      category3_id = params.require(:item).permit(:category3)["category3"]
      item_array["category_id"] = category3_id
    end
    item_array["status"] = 1
    item_params = item_array
    
  end

  def prefectures
    prefectures = [['北海道','北海道'],['青森県','青森県'],['岩手県','岩手県'],
    ['宮城県','宮城県'],['秋田県','秋田県'],['山形県','山形県'],['福島県','福島県'],
    ['茨城県','茨城県'],['栃木県','栃木県'],['群馬県','群馬県'],['埼玉県','埼玉県'],
    ['千葉県','千葉県'],['東京都','東京都'],['神奈川県','神奈川県'],['新潟県','新潟県'],
    ['富山県','富山県'],['石川県','石川県'],['福井県','福井県'],['山梨県','山梨県'],
    ['長野県','長野県'],['岐阜県','岐阜県'],['静岡県','静岡県'],['愛知県','愛知県'],
    ['三重県','三重県'],['滋賀県','滋賀県'],['京都府','京都府'],['大阪府','大阪府'],
    ['兵庫県','兵庫県'],['奈良県','奈良県'],['和歌山県','和歌山県'],['鳥取県','鳥取県'],
    ['島根県','島根県'],['岡山県','岡山県'],['広島県','広島県'],['山口県','山口県'],
    ['徳島県','徳島県'],['香川県','香川県'],['愛媛県','愛媛県'],['高知県','高知県'],
    ['福岡県','福岡県'],['佐賀県','佐賀県'],['長崎県','長崎県'],['熊本県','熊本県'],
    ['大分県','大分県'],['宮崎県','宮崎県'],['鹿児島県','鹿児島県'],['沖縄県','沖縄県']]
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_credit
    @credit = Credit.find_by(user_id: current_user.id)
  end

end

