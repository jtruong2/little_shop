class OrdersController < ApplicationController
  before_action :blank_order, only: [:new, :create, :fill_in, :set_address]
  def index
    @user = current_user
    @orders = @user.orders
  end

  def new
  end

  def create
    fill_in
    @order.save
    order_items(@order)
    flash[:notice] = "Order was successfully placed"
    session[:cart].clear
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end

  private

  def blank_order
    @order = Order.new
  end

  def fill_in
    @order.total = @cart.total
    @order.subtotal = @cart.total
    @order.user_id = current_user.id
    @order.items << @cart.items
    set_address
  end

  def set_address
    @order.order_address = current_user.address
    @order.order_city = current_user.city
    @order.order_state = current_user.state
    @order.order_zipcode = current_user.zipcode
    @order.order_phone = current_user.phone
  end
  def order_items(order)
   order.items.each do |item|
   qty = @cart.contents["#{item.id}"]
   order.items_orders.create(order_id: order.id, item_id: item.id, quantity: qty, sale_price: item.price)
   end
  end
end
