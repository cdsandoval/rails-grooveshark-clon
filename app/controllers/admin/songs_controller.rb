class Admin::SongsController < ApplicationController

  def index
    @songs = Song.all
    render :index
  end

  def show
    @song = Song.find(params[:id])
    p @song
  end
  
  def new
    @song = Song.new
  end

  def create  
    @song = Song.new(song_params)
    @song.save
    redirect_to admin_songs_path(@song), notice: "The song was created successfully, enjoy!"
  end

  def edit
    @song = Song.find(params[:id_song])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(params)
      redirect_to admin_songs_path, notice: "This song was updated!"
    else
      render :edit
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to admin_songs_path, notice: "The song was successfully deleted"
  end
end