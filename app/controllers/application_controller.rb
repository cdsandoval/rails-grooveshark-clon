class ApplicationController < ActionController::Base
  include Pundit
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
end
