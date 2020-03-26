class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :delete_session_item_id
  before_action :basic_auth, if: :production?

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
                                                                            :phone,
                                                                            :sendname_first,
                                                                            :sendname_last,
                                                                            :sendname_first_kana,
                                                                            :sendname_last_kana]])
  end

  def delete_session_item_id
    session.delete(:item_id) if session[:item_id]
  end
  private
  def production?
    Rails.env.production?
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
