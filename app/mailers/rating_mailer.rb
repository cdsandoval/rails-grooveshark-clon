class RatingMailer < ApplicationMailer
    default from: 'notifications@myblog.com'
  
    def report_most_popular_songs
      @songs = Song.joins(:ratings).group('songs.id').order('COUNT(ratings.id) DESC').limit(3)
      new_data = @songs.reduce(""){ | str, song | "#{str},#{song.id}"}
      unless $most_popular_songs && $most_popular_songs == new_data
        $most_popular_songs = new_data
        @user = params[:user]
        @songs = Song.joins(:ratings).group('songs.id').order('COUNT(ratings.id) DESC').limit(3)
        mail(to: @user.email, subject: 'Most Popular Songs')
      end
    end

    def report_most_popular_artists
      @artists = Artist.joins(songs: :ratings).group('artists.id').order("COUNT(ratings.id) DESC").limit(3)
      new_data = @artists.reduce(""){ | str, artist | "#{str},#{artist.id}"}
      unless $most_popular_artists && $most_popular_artists == new_data
        $most_popular_artists = new_data
        @user = params[:user]
        @artists = Artist.joins(songs: :ratings).group('artists.id').order("COUNT(ratings.id) DESC").limit(3)
        mail(to: @user.email, subject: 'Most Popular Artists')
      end
    end

    def report_most_popular_albums
      @albums = Album.joins(:ratings).group('album.id').order('COUNT(ratings.id) DESC').limit(3)
      new_data = @albums.reduce(""){ | str, album | "#{str},#{album.id}"}
      unless $most_popular_albums && $most_popular_albums == new_data
        $most_popular_albums = new_data
        @user = params[:user]
        @albums = Album.joins(:ratings).group('album.id').order('COUNT(ratings.id) DESC').limit(3)
        mail(to: @user.email, subject: 'Most Popular Albums')
      end
    end

    def report_less_popular_songs
      @songs = Song.joins(:ratings).group('songs.id').order('COUNT(ratings.id) ASC').limit(3)
      new_data = @songs.reduce(""){ | str, song | "#{str},#{song.id}"}
      unless $less_popular_songs && $less_popular_songs == new_data
        $less_popular_songs = new_data
        @user = params[:user]
        @songs = Song.joins(:ratings).group('songs.id').order('COUNT(ratings.id) ASC').limit(3)
        mail(to: @user.email, subject: 'Most Popular Songs')
      end
    end

    def report_most_rated_songs
      @songs = Song.joins(:ratings).group('songs.id').order('SUM(ratings.value) DESC').limit(3)
      new_data = @songs.reduce(""){ | str, song | "#{str},#{song.id}"}
      unless $most_rated_songs && $most_rated_songs == new_data
        $most_rated_songs = new_data
        @user = params[:user]
        @songs = Song.joins(:ratings).group('songs.id').order('SUM(ratings.value) DESC').limit(3)
        mail(to: @user.email, subject: 'Most Rated Songs')
      end
    end
  end