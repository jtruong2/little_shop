class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_param(params[:id])
    @items = @category.items
  end
end
