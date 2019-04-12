class Api::ArtistsController < ApplicationController
  def index
    render json: Artist.all
  end

  def show 
    render json: Artist.find(params[:id]) ,status: :ok
  end

  def songs
     @artist=Artist.find(params[:id])
     render json: @artist.songs , status: :ok
  end

  def albums
    @artist=Artist.find(params[:id])
    render json: @artist.albums, status: :ok
 end



  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

end