class Api::AlbumsController < ApplicationController
  def index
    albums = Album.order('created_at DESC');
    render json: {status: 'SUCCESS', message: 'Loaded albums', data: albums}, status: :ok
  end

  def show
    album = Album.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded album', data: album}, status: :ok 
  end

  def create 
    album = Album.new(album_params)
    if album.save
      render json: {status: 'SUCCESS', message: 'Saved album', data: album},
      status: :ok
    else
      render json: {status: 'ERROR', message: 'Album not saved', data:album.errors},
      status: :unprocessable_entity
    end
  end


  private

  def album_params
    params.permit(:title, :rating)
  end
end