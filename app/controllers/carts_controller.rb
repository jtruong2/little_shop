class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    id = params[:item_id].to_s
    item = Item.find_by(id: id)
    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to '/menu'
  end

  def show
    byebug
    @items = @cart.items
  end

  def destroy
    id = params[:item_id].to_s
    item = Item.find(id)
    @cart.remove_item(item.id)

    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to cart_path(@cart)
  end
end

