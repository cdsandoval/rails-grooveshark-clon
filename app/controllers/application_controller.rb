class ApplicationController < ActionController::Base
  include Pundit
  def after_sign_in_path_for(resource)
    if current_user.role == "admin"
      admin_artists_path
    elsif current_user.role = "regular"
      "home#index"
    end
  end
end
