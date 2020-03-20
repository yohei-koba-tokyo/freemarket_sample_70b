class CreditsController < ApplicationController


  require "payjp"
  before_action :set_credit

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    # credit = Credit.where(user_id: current_user.id).first
    redirect_to action: "index" if current_user.credit.present?
  end

  def index #CardのデータをPayjpに送って情報を取り出す
    if @credit.present?
      Payjp.api_key =ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @credit_information = customer.cards.retrieve(@credit.card_id)

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

  def destroy #PayjpとCardのデータベースを削除
    Payjp.api_key =ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(@credit.customer_id)
    customer.delete
    if @credit.destroy #削除に成功した時にポップアップを表示します。
      redirect_to action: "index", notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end
 # indexアクションはここでは省略

  def create #Payjpとcreditのデータベースを作成
    Payjp.api_key =ENV['PAYJP_SECRET_KEY']
    # テスト用の秘密鍵を入れてあります
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        email: current_user.email,
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id} # 無くてもOK。
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_credit
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end
end