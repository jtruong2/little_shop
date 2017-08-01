  class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.email}"
      check_admin
    else
      flash[:warning] = "Failed to log in, try again"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end

  private

  def check_admin
    if @user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end
end
