class ApplicationController < ActionController::Base
  #要有 admin 權限才能進入
  protect_from_forgery with: :exception

  def admin_required #要有 admin 權限才能進入
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin"
    end
  end
end
