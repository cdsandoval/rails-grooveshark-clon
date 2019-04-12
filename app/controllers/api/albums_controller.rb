class Api::AlbumsController < ApplicationController
  def index
    albums = Album.order('created_at DESC');
    render json: {status: 'SUCCESS', message: 'Loaded albums', data: albums}, status: :ok
  end

end