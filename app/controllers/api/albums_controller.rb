class Api::AlbumsController < ApplicationController
  def index
    albums = Album.order('created_at DESC');
    render json: {status: 'SUCCESS', message: 'Loaded albums', data: albums}, status: :ok
  end

  def show
    album = Album.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded album', data: album}, status: :ok 
  end
end