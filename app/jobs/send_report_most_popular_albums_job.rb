class SendReportMostPopularAlbumsJob < ApplicationJob
  queue_as :default

  def perform
    reschedule_job
    User.all.each do |user|
      RatingMailer
        .with(user: user)
        .report_most_popular_albums
        .deliver_later
    end
  end

  def reschedule_job
    self.class.set(wait_until: Date.tomorrow.noon).perform_later
  end
end
