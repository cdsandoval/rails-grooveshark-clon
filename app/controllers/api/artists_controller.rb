class Api::ArtistsController < ApplicationController
  def index
    render json: Artist.all
  end

  def show 
    render json: Artist.find(params[:id]) ,status: :ok
  end

  def artist_show
    render json: Song.find(params[:artist_id])
  end
  
end