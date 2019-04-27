class UserMailer < ApplicationMailer
  def user_created
    @user = params[:user]
    mail(to: @user.email, subject: 'New user created')
  end

  def user_welcoming
    @user = params[:user]
    @songs = Song.joins(:ratings).group('songs.id').order('COUNT(ratings.id) DESC').limit(3)
    mail(to: @user.email, subject: "Welcome #{@user.email} to GrooveShark!")
  end
end
