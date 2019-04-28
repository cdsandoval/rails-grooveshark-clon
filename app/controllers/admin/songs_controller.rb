class Admin::SongsController < ApplicationController
  before_action :require_auth

  def index
    # Just for testing
    # SendReportMostPopularSongsJob.perform_later
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
        a = @song.albums.first
        if a.songs.count == 1
        SendSongCreatedNotificacionJob.perform_now @song
        end
      redirect_to admin_songs_path, notice: "Song was successfully created"
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to admin_songs_path(@song), notice: "This song was updated!"
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to admin_songs_path, notice: "The song was successfully deleted"
  end

  def add_album
    song = Song.find(params[:song_id])
    # if params.key?("album_id")
    #   album = Album.find(params[:album_id])
    #   song.albums << album 
    # end

    @album = Album.find(params[:album_id])
    @song.albums << album

    redirect_to edit_admin_song_path(song)
  end

  private

  def song_params
    params.require(:song).permit(
      :title,
      :duration,
      :rating,
      :progress,
      :cover,
      :song_ids
    )
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

  def require_auth
    authorize [:admin, Song]
  end
end