class OrdersController < ApplicationController
  before_action :blank_order, only: [:new, :create, :fill_in, :set_address]
  before_action :validate_path, only: [:index]

  def index
    @user = current_user
  end

  def new
  end

  def create
    fill_in
    if @order.save
      checkout(@order)
    else
      flash[:warning] = "Order failed, please try again."
      redirect_to cart_path
    end

  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
    @items_info = @order.item_orders
  end

  def status_cancel
    order = Order.find(params[:order_id])
    order.cancelled!
    redirect_to order_path(order)
  end

  def status_paid
    order = Order.find(params[:order_id])
    order.paid!
    redirect_to order_path(order)
  end

  def status_completed
    order = Order.find(params[:order_id])
    order.completed!
    redirect_to order_path(order)
  end

  private

  def blank_order
    @order = Order.new
  end

  def checkout(order)
    order_items(order)
    flash[:notice] = "Order was successfully placed"
    session[:cart].clear
    redirect_to orders_path
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
   order.item_orders.each do |item_order|
     item = Item.find(item_order.item_id)
     qty = @cart.contents["#{item.id}"]
     item_order.quantity = qty; item_order.sale_price = item.price
     item_order.save
   end
  end

  def validate_path
    if request.referrer == admin_dashboard_url || params[:status] != nil
      @orders = Order.where(status: params[:status])
    else
      @orders = current_user.orders
    end
  end
end
