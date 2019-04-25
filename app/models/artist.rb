class Artist < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :albums, join_table: 'associations'
  has_one_attached :cover


  validates :name, presence: true, length: {in: 1..300}
  validates :age, presence: true, numericality:true, length: {maximum: 2}
end
