class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

<<<<<<< HEAD
 def authorize
   redirect_to '/login' unless current_user
 end
=======
>>>>>>> story13-view-past-order
end
