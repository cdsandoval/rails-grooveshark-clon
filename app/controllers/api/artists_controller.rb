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
    render json: @artist.albums , status: :ok
  end
  def search
    if params[:name]
      render json: Artist.where(name: params[:name]) , status: :ok
    else
      render json: { message: "It's necessary the name to search" }, status: :bad_request
    end
  end



  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

end