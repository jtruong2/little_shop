class ReviewsController < ApplicationController

  before_action :authorize, only: [:create, :destroy]

  def create
    @review = Review.new(review_params)
    @review.item_id = params[:item_id]
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "Review posted by #{@review.user.email}"
      redirect_to @review.item
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @item = @review.item
    @review.destroy

    flash[:delete] = "Review deleted"
    redirect_to @item
  end

  private

  def review_params
    params.require(:review).permit(:body, :item_id, :user_id)
  end
end
