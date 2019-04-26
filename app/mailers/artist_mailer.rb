class ArtistMailer < ApplicationMailer
  def artist_created
    @user = params[:user]
    @artist = params[:artist]
    mail(to: @user.email, subject: 'New artist created')
  end
end
