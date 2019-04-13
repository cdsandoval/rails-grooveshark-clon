class Admin::SongsController <ApplicationController
  def destroy
    song = Song.find(params[:id])
    song.delete
  end

end