class Api::AlbumPolicy < ApplicationPolicy  

  def index?  
    @user
  end

  def show?  
    @user
  end

  def search?  
    @user
  end

  def artists?  
    @user
  end

  def songs?  
    @user
  end

  def album_rating?  
    @user
  end

end 