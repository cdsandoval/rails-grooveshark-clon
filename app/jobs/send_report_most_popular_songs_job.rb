# class SendReportMostPopularSongsJob < ApplicationJob
#   queue_as :default

#   def perform(*args)
#     User.all.each do |user|
#       SongMailer
#         .with(user: user, song: song)
#         .article_created
#         .deliver_later
#     end
#   end
# end
