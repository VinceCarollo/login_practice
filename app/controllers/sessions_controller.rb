class SessionsController < ApplicationController
  def new
  end

  def create
    if User.authenticate(params[:email_address], params[:password])
      user = User.find_by(email_address: params[:email_address])
      session[:login] = true
      flash.notice = "Welcome #{user.name}, you are logged in!"
      redirect_to users_path
    else
      flash.notice = "Invalid email/password combination"
      redirect_to login_path
    end
  end
end
