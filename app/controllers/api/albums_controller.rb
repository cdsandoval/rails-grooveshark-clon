class Api::AlbumsController < ApplicationController
  def index
    render json: Album.all
  end

  def show
    album = Album.find(params[:id])
    render json: album
  end

  def search
    if params.has_key?("title")
      albums = Album.where("title like ?", "%#{params[:title]}%")
      render json: albums
    else
      render json: Album.all
    end
  end

  def artists
    album = Album.find(params[:id])
    render json: album.artists, status: :ok
  end

  def songs
    album = Album.find(params[:id])
    render json: album.songs, status: :ok
  end

  def album_rating

    if params.has_key?("id") and params.has_key?("rating")
      album = Album.find(params[:id])
      success = album.update(
                            rating: params[:rating]
                           )
      if success
        render json: { message: "Update successfully rating album" }, status: :ok
      else
        render json: { message: "The value of rating has to be -1, 0 or 1" }, status: :bad_request
      end
    else
      render json: { message: "This request has to have the parameters id and rating" }, status: :bad_request
    end
  end
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
end