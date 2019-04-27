class SendReportMostRatedSongsJob < ApplicationJob
  queue_as :default

  def perform
    reschedule_job
    User.where(role: "admin").each do |user|
      RatingMailer
        .with(user: user)
        .report_most_rated_songs
        .deliver_later
    end
  end

  def reschedule_job
    self.class.set(wait_until: Date.tomorrow.noon).perform_later
  end
end
