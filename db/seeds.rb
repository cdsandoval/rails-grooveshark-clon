# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Song.create(title:"Mi primera cancion", duration: 300, rating:1, progress: 0)
b = Album.create(title: "Mi primer album", rating: 1)
c = Artist.create(name: "", age: "29")

Album.first.songs << a
Album.first.songs 

