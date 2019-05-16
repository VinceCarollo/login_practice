class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.email_address == ''
      flash.notice = "Must Enter Email Address"
      redirect_to new_user_path
    elsif user.user_exists?
      flash.notice = "User Already Exists"
      redirect_to new_user_path
    else
      user.save
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address)
  end

end
