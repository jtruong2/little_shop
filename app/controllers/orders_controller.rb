class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_formatter)


  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end

  private

  def order_formatter

  end
end
