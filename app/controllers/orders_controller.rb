class OrdersController < ApplicationController
  def index
    @user = current_user
    @order = @user.orders
  end
end
