class Api::SongsController < ApplicationController
  def index
    render json: Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def artists
    # puts params.to_s
    @song = Song.find(params[:id])
    render json: @song.artists, status: :ok
  end

  def song_progress
    puts params.to_s
    song = Song.find(params[:id])
    song.progress.create(
      progress: song.progress
    )
    render json: { message: "#{Song.progress} is the minutes in progress" }, status: :ok
  end

  def song_rating
    puts params.to_s
    song = Song.find(params[:id])
    song.progress.create(
      rating: song.rating
    )
    render json: { message: "#{Song.rating} is the current rating" }, status: :ok
  end
  
end