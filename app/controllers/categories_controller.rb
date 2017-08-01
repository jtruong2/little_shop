class CategoriesController < ApplicationController
  def index
		@categories = Category.all
  end

  def show
    @category = Category.find_by_param(params[:id])
    @items = @category.items
  end
end
