class Admin::SongPolicy < ApplicationPolicy  

  def index?  
    @user&.role?('admin')
  end
 
end 