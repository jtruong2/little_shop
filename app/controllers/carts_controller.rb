class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    id = params[:item_id].to_s
    item = Item.find_by(id: id)
    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    send_back
  end

  def show
    @items = @cart.items
  end

  def destroy
    id = params[:item_id].to_s
    item = Item.find(id)
    @cart.remove_item(item.id)

    session[:cart] = @cart.contents
    flash[:notice] = %Q[Successfully removed <a href="/menu/#{item.id}">#{ item.title }</a> from your cart.].html_safe
    redirect_to cart_path(@cart)
  end
  private

  def send_back
    if request.url == items_url
      byebug
      redirect_to items_path
    else
      redirect_to cart_path
    end
  end
end
