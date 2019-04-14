class Admin::SongsController <ApplicationController
  def destroy
    song = Song.find(params[:id])
    song.delete
    redirect_to admin_songs_path
  end

end