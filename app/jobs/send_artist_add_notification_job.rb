class SendArtistAddNotificationJob < ApplicationJob
  queue_as :default

  def perform(album)
    User.all.each do |user|
      AlbumMailer
      .with(user: user, album: album)
      .album_created
      .delivery_later
    end
  end
end
