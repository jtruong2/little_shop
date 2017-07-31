class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user, :get_alerts



  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
