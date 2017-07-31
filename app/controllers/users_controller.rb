class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.email}"
      redirect_to dashboard_path
    else
      flash[:notice] = "Log in failed, try again"
      redirect_to new_user_path
    end
  end

  def show
    if session[:user_id].nil?
      flash[:notice] = "You don't have access to that page!"
      redirect_to root_path
    else
      @user = User.find(session[:user_id])
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :address, :city, :state, :zipcode, :phone)
  end
end
