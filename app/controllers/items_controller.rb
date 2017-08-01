class ItemsController < ApplicationController
  def index
    @items = Item.all
    if params[:s]
      @items = Item.search(params[:s])
    end
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
