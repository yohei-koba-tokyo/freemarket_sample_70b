class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @parents = Category.where(ancestry: nil)
    @user_address_id = current_user.address.id
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice:"本人情報の更新に成功しました。再度ログインをお願いします。"
    else
      redirect_to "/users/#{current_user.id}/edit", notice:"本人情報の更新に失敗しました。"
    end
  end


  private
  def user_params
    params.require(:user).permit(:nickname,:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:last_name_kana,:birthday,:password,:password_confirmation)
  end


end
