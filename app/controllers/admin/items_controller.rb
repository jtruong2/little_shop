class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "#{@item.title} Added!"
      redirect_to new_admin_item
    else
      flash[:error] = "Error"
      render :new
    end
  end
end
