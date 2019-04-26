class RatingMailer < ApplicationMailer
    default from: 'notifications@myblog.com'
  
    def report_most_popular_songs
      @user = params[:user]
      @songs = Song.all
      mail(to: @user.email, subject: 'Most Popular Songs')
    end
  end