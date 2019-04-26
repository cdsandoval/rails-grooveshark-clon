class Api::ArtistsController < ApplicationController
  before_action :require_auth  

  def index
    render json: Artist.all
  end

  def show 
    render json: Artist.find(params[:id]), status: :ok
  end

  def songs
    artist = Artist.find(params[:id])
     render json: artist.songs , status: :ok
  end

  def albums
    artist = Artist.find(params[:id])
    render json: artist.albums , status: :ok
  end
  
  def search
    if params.has_key?("name")
      artists = Artist.where("name like ?", "%#{params[:name]}%")
      render json: artists , status: :ok
    else
      render json: Artist.all
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

  def require_auth
    authorize [:api, Artist]
  end
end