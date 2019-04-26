class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    if current_user.role == "admin"
      admin_home_path
    elsif current_user.role = "regular"
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    if current_user.role == "admin"
      admin_home_path
    elsif current_user.role = "regular"
      root_path

    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
