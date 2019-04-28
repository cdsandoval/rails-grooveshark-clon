class AlbumMailer < ApplicationMailer
  def album_created
    @user = params[:user]
    @album = params[:album]
    mail(to: @user.email, subject: 'New artist created')
  end
end
