class AddressesController < ApplicationController

  def edit
    @address = Address.find_by(id:params[:id])
  end

  def update
    @address = Address.find_by(id:params[:id])
    if @address.update(address_params)
      redirect_to "/users/#{current_user.id}", notice:"登録住所の更新に成功しました。"
    else
      redirect_to edit_user_address_path, notice:"登録住所の更新に失敗しました。"
    end
  end


  private
  def address_params
    params.require(:address).permit(:postcode,:prefecture,:municipality,:address,:room_number,:sendname_first,:sendname_last,:sendname_first_kana,:sendname_last_kana,:phone)
  end


end
