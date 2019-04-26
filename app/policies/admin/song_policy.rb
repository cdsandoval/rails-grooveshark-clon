class Admin::SongPolicy < ApplicationPolicy  

  def index?  
    @user&.role?('admin')
  end

  def show?  
    @user&.role?('admin')
  end

  def new?  
    @user&.role?('admin')
  end

  def edit?  
    @user&.role?('admin')
  end

  def update?  
    @user&.role?('admin')
  end

  def destroy?  
    @user&.role?('admin')
  end
 
end 