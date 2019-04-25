class SongPolicy < ApplicationPolicy  

  def index?  
    @user&.role?('admin')
  end
 
end 