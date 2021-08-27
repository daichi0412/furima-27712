class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @items = user.items
  end

  def new
    @user =User.new
  end

  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password)
  end
end