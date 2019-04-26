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

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(artist_params)
      if @artist.save
          ArtistMailer.with(user: current_user, artist: @artist).artist_created.deliver_now
          redirect_to admin_artists_path(@artist), notice: "The artist was created successfully, enjoy!"
      else
        render :new
      end
   end

   def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to admin_artist_path(@artist), notice: "This artist was updated!"
    else
      render :edit
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
