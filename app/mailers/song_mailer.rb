class SongMailer < ApplicationMailer
  def song_created
    @user = params[:user]
    @song = params[:song]
    mail(to: @user.email, subject: 'New song created')
  end
end
