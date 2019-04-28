class SendSongCreatedNotificacionJob < ApplicationJob
  queue_as :default

  def perform(song)
    User.all.each do |user|
      SongMailer
      .with(user: user, song: song)
      .song_created
      .deliver_later
    end
  end
end
