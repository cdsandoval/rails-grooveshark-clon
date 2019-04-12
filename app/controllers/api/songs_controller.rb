class Api::SongsController < ApplicationController
  def index
    render json: Song.all
  end

  def show
    @song = Song.find(params[:id])
    render json: @song
  end

  def artists
    # puts params.to_s
    @song = Song.find(params[:id])
    render json: @song.artists, status: :ok
  end

  def song_progress
    puts params.to_s
    song = Song.find(params[:id])
    success = song.update(
                          progress: params[:progress]
                         )
    if success
      render json: { message: "Update succesful, the song has #{song.progress} seconds in progress" }, status: :ok
    else
      render json: success.errors, status: :bad_request
    end
  end

  def song_rating
    puts params.to_s
    song = Song.find(params[:id])
    song.update(
      rating: params[:rating]
    )
    render json: { message: "Update succesful rating song" }, status: :ok
  end
  
end