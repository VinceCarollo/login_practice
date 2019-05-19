class SecretsController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    unless session[:login]
      flash.notice = 'Secret Page Requires Login'
      redirect_to login_path
    end
  end

end
