class Api::SongPolicy < ApplicationPolicy  

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

  def albums?  
    @user
  end

  def song_progress?  
    @user
  end

  def song_rating?  
    @user
  end
end 