class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_param(params[:id])
    @items = @category.items
    @category_dropdown = Category.all
  end
end
