class Admin::ArtistsController < ApplicationController

  def index
     @artists = Artist.all
  end

  def show 
      @artist = Artist.find(params[:id]) 
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
      if @artist.save
          redirect_to admin_artists_path(@artist), notice: "The artist was created successfully, enjoy!"
      else
        render :new
      end
   end

   def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to admin_artists_path, notice: "The artist was successfully deleted"
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :age)
  end
end
