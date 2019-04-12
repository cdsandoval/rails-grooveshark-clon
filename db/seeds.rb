# Data
s1 = Song.create(title:"Bohemian Rhapsody", duration: 330, rating:1, progress: 0)
s2 = Song.create(title:"God Save the Queen", duration: 420, rating:1, progress: 0)
s3 = Song.create(title:"Love of My Life", duration: 300, rating:1, progress: 0)
s4 = Song.create(title:"Death on Two Legs", duration: 260, rating:0, progress: 0)
s5 = Song.create(title:"39", duration: 290, rating:0, progress: 0)
a_night_ophera = Album.create(title: "A Night at the Opera", rating: 1)
queen = Artist.create(name: "Queen", age: "50")
# Insertions
Album.find(a_night_ophera.id).songs << s1
Album.find(a_night_ophera.id).songs << s2
Album.find(a_night_ophera.id).songs << s3
Album.find(a_night_ophera.id).songs << s4
Album.find(a_night_ophera.id).songs << s5
Song.find(s1.id).artists << queen
Song.find(s2.id).artists << queen
Song.find(s3.id).artists << queen
Song.find(s4.id).artists << queen
Song.find(s5.id).artists << queen
Artist.find(queen.id).albums << a_night_ophera
Artist.find(queen.id).songs << s1
Artist.find(queen.id).songs << s2
Artist.find(queen.id).songs << s3
Artist.find(queen.id).songs << s4
Artist.find(queen.id).songs << s5

# Data
s6 = Song.create(title:"Recess", duration: 230, rating:1, progress: 0)
s7 = Song.create(title:"Try It Out", duration: 330, rating:1, progress: 0)
s8 = Song.create(title:"Coast is Clear", duration: 370, rating:1, progress: 0)
s9 = Song.create(title:"Dirty Vibe", duration: 380, rating:1, progress: 0)
s10 = Song.create(title:"Easy My Mind", duration: 330, rating:1, progress: 0)
recess = Album.create(title: "Recess", rating: 1)
skrillex = Artist.create(name: "Skrillex", age: "31")
# Insertions
Album.find(recess.id).songs << s6
Album.find(recess.id).songs << s7
Album.find(recess.id).songs << s8
Album.find(recess.id).songs << s9
Album.find(recess.id).songs << s10
Song.find(s6.id).artists << skrillex
Song.find(s7.id).artists << skrillex
Song.find(s8.id).artists << skrillex
Song.find(s9.id).artists << skrillex
Song.find(s10.id).artists << skrillex
Artist.find(skrillex.id).albums << recess
Artist.find(skrillex.id).songs << s6
Artist.find(skrillex.id).songs << s7
Artist.find(skrillex.id).songs << s8
Artist.find(skrillex.id).songs << s9
Artist.find(skrillex.id).songs << s10

# Data
s11 = Song.create(title:"Ten Seconds Before Sunrise", duration: 380, rating:1, progress: 0)
s12 = Song.create(title:"Everything", duration: 290, rating:1, progress: 0)
s13 = Song.create(title:"Dance4life", duration: 230, rating:1, progress: 0)
s14 = Song.create(title:"Elements Of Life", duration: 310, rating:1, progress: 0)
s15 = Song.create(title:"Driving to Heaven", duration: 340, rating:1, progress: 0)
elements_of_life = Album.create(title: "Elements of Life", rating: 1)
tiesto = Artist.create(name: "Tiesto", age: "50")
# Insertions
Album.find(elements_of_life.id).songs << s11
Album.find(elements_of_life.id).songs << s12
Album.find(elements_of_life.id).songs << s13
Album.find(elements_of_life.id).songs << s14
Album.find(elements_of_life.id).songs << s15
Song.find(s11.id).artists << tiesto
Song.find(s12.id).artists << tiesto
Song.find(s13.id).artists << tiesto
Song.find(s14.id).artists << tiesto
Song.find(s15.id).artists << tiesto
Artist.find(tiesto.id).albums << elements_of_life
Artist.find(tiesto.id).songs << s11
Artist.find(tiesto.id).songs << s12
Artist.find(tiesto.id).songs << s13
Artist.find(tiesto.id).songs << s14
Artist.find(tiesto.id).songs << s15

# Data
s16 = Song.create(title:"Breach (Walk Alone)", duration: 200, rating:1, progress: 0)
s17 = Song.create(title:"Yottabyte", duration: 210, rating:1, progress: 0)
s18 = Song.create(title:"Latency", duration: 290, rating:1, progress: 0)
s19 = Song.create(title:"Access", duration: 140, rating:1, progress: 0)
s20 = Song.create(title:"Waiting for Tomorrow", duration: 190, rating:1, progress: 0)
bylaw = Album.create(title: "BYLAW", rating: 1)
martin_garrix = Artist.create(name: "Martin Garrix", age: "50")
# Insertions
Album.find(bylaw.id).songs << s16
Album.find(bylaw.id).songs << s17
Album.find(bylaw.id).songs << s18
Album.find(bylaw.id).songs << s19
Album.find(bylaw.id).songs << s20
Song.find(s16.id).artists << martin_garrix
Song.find(s17.id).artists << martin_garrix
Song.find(s18.id).artists << martin_garrix
Song.find(s19.id).artists << martin_garrix
Song.find(s20.id).artists << martin_garrix
Artist.find(martin_garrix.id).albums << bylaw
Artist.find(martin_garrix.id).songs << s16
Artist.find(martin_garrix.id).songs << s17
Artist.find(martin_garrix.id).songs << s18
Artist.find(martin_garrix.id).songs << s19
Artist.find(martin_garrix.id).songs << s20

# Data
s21 = Song.create(title:"Shaky Shaky", duration: 240, rating:1, progress: 0)
s22 = Song.create(title:"Adictiva", duration: 230, rating:1, progress: 0)
s23 = Song.create(title:"Hula Hoop", duration: 200, rating:1, progress: 0)
s24 = Song.create(title:"Vuelve", duration: 220, rating:1, progress: 0)
s25 = Song.create(title:"Con Calma", duration: 230, rating:1, progress: 0)
el_disco_duro = Album.create(title: "BYLAW", rating: 1)
daddy_yankee = Artist.create(name: "Martin Garrix", age: "50")
# Insertions
Album.find(el_disco_duro.id).songs << s21
Album.find(el_disco_duro.id).songs << s22
Album.find(el_disco_duro.id).songs << s23
Album.find(el_disco_duro.id).songs << s24
Album.find(el_disco_duro.id).songs << s25
Song.find(s21.id).artists << daddy_yankee
Song.find(s22.id).artists << daddy_yankee
Song.find(s23.id).artists << daddy_yankee
Song.find(s24.id).artists << daddy_yankee
Song.find(s25.id).artists << daddy_yankee
Artist.find(daddy_yankee.id).albums << el_disco_duro
Artist.find(daddy_yankee.id).songs << s21
Artist.find(daddy_yankee.id).songs << s22
Artist.find(daddy_yankee.id).songs << s23
Artist.find(daddy_yankee.id).songs << s24
Artist.find(daddy_yankee.id).songs << s25
