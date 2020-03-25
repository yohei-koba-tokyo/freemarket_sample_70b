class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :delete_session_item_id

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,
                                                       :last_name,
                                                       :first_name,
                                                       :last_name_kana,
                                                       :first_name_kana,
                                                       :birthday,
                                                       :profile, 
                                                       address_attributes: [:postcode,
                                                                            :prefecture,
                                                                            :municipality,
                                                                            :address,
                                                                            :room_number,
                                                                            :phone]])
  end



  # 中島作成（全コントローラー実行前に呼び出される処理）
  def delete_session_item_id
    # セッションに商品IDが設定されていた場合、セッションから商品IDを削除する
    session.delete(:item_id) if session[:item_id]
  end


  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:BASIC_AUTH_USER] && password == Rails.application.credentials[:BASIC_AUTH_PASSWORD]
    end
  end
end
