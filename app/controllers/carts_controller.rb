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
    flash[:html_notice] = "Successfully removed #{view_context.link_to("#{item.title}", item_path(item.id))} from your cart.".html_safe
    redirect_to cart_path(@cart)
  end
  private

  def send_back
    if request.referrer == items_url
      redirect_to items_path
    else
      redirect_to cart_path
    end
  end
end
