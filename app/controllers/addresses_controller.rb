class AddressesController < ApplicationController
  def index

  end

  def new
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, address_attributes:[:id, :postage, :prefecture, :municipality, :address])
  end

end
