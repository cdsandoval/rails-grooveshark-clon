class Api::SongsController < ApplicationController
  def index
    render json: Song.all
  end

  def show
    @song = Song.find(params[:id])
    render json: @song
  end

  def artists
    @song = Song.find(params[:id])
    render json: @song.artists, status: :ok
  end

  def song_progress
    song = Song.find(params[:id])
    song.progress.create(
      progress: params[:progress]
    )
    render json: { message: "Update successfull the song #{song.progress} seconds in progress" }, status: :ok
  end

  def song_rating
    song = Song.find(params[:id])
    song.progress.create(
      rating: params[:rating]
    )
    render json: { message: "#{song.rating} updated successfully" }, status: :ok
  end
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
end