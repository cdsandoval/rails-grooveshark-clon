class Api::SongPolicy < ApplicationPolicy  

  def index?  
    @user
  end
 
end 