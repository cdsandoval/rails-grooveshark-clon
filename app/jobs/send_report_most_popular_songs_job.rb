class SendReportMostPopularSongsJob < ApplicationJob
  queue_as :default

  def perform
    reschedule_job
    User.all.each do |user|
      RatingMailer
        .with(user: user)
        .report_most_popular_songs
        .deliver_later
    end
  end

  def reschedule_job
    self.class.set(wait: 2.minutes).perform_later
  end
end
