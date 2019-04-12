class Artist < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :albums, join_table: 'associations'

  validates :name, presence: true, length: {in: 1..300}
  
  validates :age, presence: true, length: {maximum: 2}, numericality: true
end
