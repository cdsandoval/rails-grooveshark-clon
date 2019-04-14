class Api::AlbumsController < ApplicationController
  def index
    @album = Album.order('created_at DESC');
    render json: {
           status: 'SUCCESS', 
           message: 'Loaded albums', 
           data: @album}, 
           status: :ok
  end

  def show
    @album = Album.find(params[:id])
    render json: {
           status: 'SUCCESS', 
           message: 'Loaded album', 
           data: @album}, status: :ok 
  end

  def songs
    @album = Album.find(params[:id])
    render json: @album.songs, status: :ok
  end

  def album
    album = Song.find(params[:id])
    success = album.update(
                          rating: params[:rating]
                         )
    if success
      render json: { message: "Album rating updated successfully" }, status: :ok
    else
      render json: { message: "The value of rating has to be -1, 0 or 1" }, status: :bad_request
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end


  # Admin methods
  # def create 
  #   @album = Album.new(album_params)
  #   if @album.save
  #     render json: {status: 'SUCCESS', message: 'Saved album', data: @album},
  #     status: :ok
  #   else
  #     render json: {status: 'ERROR', message: 'Album not saved', data:@album.errors},
  #     status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @album = Album.find(params[:id])
  #   @album.destroy
  #   render json: {status: 'ERROR', message: 'Deleted album', data:@album},
  #     status: :ok
  # end

  # def update
  #   @album = Album.find(params[:id])
  #   if @album.update_attributes(album_params)
  #     render json: {status: 'SUCCESS', message: 'Updated album', data:@album},
  #     status: :ok
  #   else
  #     render json: {status: 'ERROR', message: 'Article not updated', data:@album.errors},
  #     status: :unprocessable_entity
  #   end
  # end

  private

  def album_params
    params.permit(:title, :rating)
  end
end