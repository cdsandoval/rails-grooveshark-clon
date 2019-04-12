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
    success = song.update(
                          progress: params[:progress]
                         )
    if success
      render json: { message: "Update succesful, the song has #{song.progress} seconds in progress" }, status: :ok
    else
      render json: { message: "The value of progress has to be lower or equal than #{song.duration}" }, status: :bad_request
    end
  end

  def song_rating
    song = Song.find(params[:id])
    success = song.update(
                          rating: params[:rating]
                         )
    if success
      render json: { message: "Update successfully rating song" }, status: :ok
    else
      render json: { message: "The value of rating has to be -1, 0 or 1" }, status: :bad_request
    end
  end
  
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
end