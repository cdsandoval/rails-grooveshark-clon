class Api::ArtistPolicy < ApplicationPolicy  

  def index?  
    @user
  end

  def show?  
    @user
  end

  def songs?  
    @user
  end

  def albums?  
    @user
  end

  def search?  
    @user
  end
end 