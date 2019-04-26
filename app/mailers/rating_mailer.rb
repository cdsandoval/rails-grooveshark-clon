class RatingMailer < ApplicationMailer
    default from: 'notifications@myblog.com'
  
    def report_most_popular_songs
      @user = params[:user]
      @songs = Song.joins(:ratings).group('songs.id').order('COUNT(ratings.id) DESC').limit(3)
      mail(to: @user.email, subject: 'Most Popular Songs')
    end

    def report_most_popular_artists
      @user = params[:user]
      @artists = Artist.all.limit(3)
      mail(to: @user.email, subject: 'Most Popular Artists')
    end

    def report_most_popular_albums
        @user = params[:user]
        @albums = Album.joins(:ratings).group('album.id').order('COUNT(ratings.id) DESC').limit(3)
        mail(to: @user.email, subject: 'Most Popular Albums')
    end
  end