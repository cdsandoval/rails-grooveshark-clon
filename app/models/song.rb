class Song < ApplicationRecord
  has_and_belongs_to_many :albums, join_table: 'associations'
  has_and_belongs_to_many :artists, join_table: 'associations'

  validates :title, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 0 }
  validates :rating, inclusion: { in: [ 1, 0, -1 ]}
  validates :progress, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_update :max_playback

  def  max_playback
    if self.progress > self.duration
      return false
    end
  end

end
