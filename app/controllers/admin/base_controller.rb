class Admin::BaseController < ApplicationController
  before_action :require_admin

  def current_admin?
    current_user && current_user.admin?
  end

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
