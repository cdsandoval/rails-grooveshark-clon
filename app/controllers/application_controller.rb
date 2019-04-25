class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.role == "admin"

    elsif current_user.role = "regular"

    end
  end
end
