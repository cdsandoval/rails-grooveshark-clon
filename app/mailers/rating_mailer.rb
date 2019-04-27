class RatingMailer < ApplicationMailer
    default from: 'notifications@myblog.com'
  
    def report_most_popular_songs
      @user = params[:user]
      @songs = Song.joins(:ratings).group('songs.id').order('COUNT(ratings.id) DESC').limit(3)
      mail(to: @user.email, subject: 'Most Popular Songs')
    end

    def report_most_popular_artists
      @user = params[:user]
      @artists = Artist.joins(songs: :ratings).group('artists.id').order("COUNT(ratings.id) DESC").limit(3)
      mail(to: @user.email, subject: 'Most Popular Artists')
    end

    def report_most_popular_albums
      @user = params[:user]
      @albums = Album.joins(:ratings).group('album.id').order('COUNT(ratings.id) DESC').limit(3)
      mail(to: @user.email, subject: 'Most Popular Albums')
    end

    def report_less_popular_songs
      @user = params[:user]
      @songs = Song.joins(:ratings).group('songs.id').order('COUNT(ratings.id) ASC').limit(3)
      mail(to: @user.email, subject: 'Most Popular Songs')
    end

    def report_most_rated_songs
      @user = params[:user]
      @songs = Song.joins(:ratings).group('songs.id').order('SUM(ratings.value) DESC').limit(3)
      mail(to: @user.email, subject: 'Most Rated Songs')
    end
  end