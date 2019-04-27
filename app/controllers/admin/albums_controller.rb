class Admin::AlbumsController < ApplicationController
  before_action :require_auth 
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end
  
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      creator = @album.artists.first 
      if creator.albums.count == 1 
        SendAlbumCreatedNotificationJob.perform_now @album
      end
      redirect_to admin_albums_path, notice: 'Album was successfully created.'
    else
      render :new
    end    
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])   
    if @album.update(album_params)
      redirect_to admin_album_path(@album), notice: "This song was updated!"
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to admin_albums_path, notice: "The song was successfully deleted"
  end

  def add_artist
    album = Album.find(params[:album_id])
    @artist = Artist.find(params[:artist_id])
    @album.artists << artist
    
    redirect_to edit_admin_album_path(album)
  end

  private

  def album_params
    params.require(:album).permit(
      :title,
      :rating,
      :cover,
      :artist_ids
    )
  end


  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

  def require_auth
    authorize [:admin, Album]
  end
end