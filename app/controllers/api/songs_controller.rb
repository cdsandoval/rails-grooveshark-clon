class Api::SongsController < ApplicationController
  def index
    render json: Song.all
  end

  def show
    song = Song.find(params[:id])
    render json: song
  end

  def search
    if params.has_key?("title")
      songs = Song.where("title like ?", "%#{params[:title]}%")
      render json: songs
    else
      render json: Song.all
    end
  end

  def artists
    song = Song.find(params[:id])
    render json: song.artists, status: :ok
  end

  def song_progress
    if params.has_key?("id") and params.has_key?("progress")
      song = Song.find(params[:id])
      success = song.update(
                            progress: params[:progress]
                           )
      if success
        render json: { message: "Update succesful, the song has #{song.progress} seconds in progress" }
      else
        render json: { message: "Progress has to be lower or equal than #{song.duration}" }, status: :bad_request
      end
    else
      render json: { message: "This request has to have the parameters id and progress" }, status: :bad_request
    end
  end

  def song_rating

    if params.has_key?("id") and params.has_key?("rating")
      song = Song.find(params[:id])
      success = song.update(
                            rating: params[:rating]
                           )
      if success
        render json: { message: "Update successfully rating song" }, status: :ok
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