class SessionsController < ApplicationController
  def login
  end

  def authorize
    user = User.find_by(email_address: params[:email_address])
    if User.authenticate(user.email_address, user.password)
      session[:login] = true
      flash.notice = "Welcome #{user.name}, you are logged in!"
      redirect_to users_path
    else
    end
  end
end
