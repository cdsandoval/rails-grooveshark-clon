class Album < ApplicationRecord
  has_and_belongs_to_many :artists, join_table: 'associations'
  has_and_belongs_to_many :songs, join_table: 'associations'

  validates :title, presence: true,
            length:    { minimum:1, maximum:300 }
  validates :rating, 
            inclusion: { in: [ 1, 0, -1 ] }

end
