# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
nirvana = Band.new(name: 'nirvana')
beatles = Band.new(name: 'beatles')

nirvana.save
beatles.save

nevermind = Album.new(title: 'nevermind', year: 1991, live: false, band_id: nirvana.id)
whitealbum = Album.new(title: 'white album', year: 1968, live: false, band_id: beatles.id)
inutero = Album.new(title: 'In utero', year: 1993, live: false, band_id: nirvana.id)
mtvunplugged = Album.new(title: 'mtv unplugged', year: 1995, live: true, band_id: nirvana.id)
nevermind.save
whitealbum.save
inutero.save
mtvunplugged.save

teenspirit = Track.new(title: 'Smells like teen spirit', ord: 1, album_id: nevermind.id)
inbloom = Track.new(title: 'In bloom', ord: 2, album_id: nevermind.id)

teenspirit.save
inbloom.save

blackbird = Track.new(title: 'Blackbird', ord: 1, album_id: whitealbum.id)
rockyracoon = Track.new(title: 'Rocky racoon', ord: 2, album_id: whitealbum.id)
helterskelter = Track.new(title: 'Helterskelter', ord: 3, album_id: whitealbum.id)

blackbird.save
rockyracoon.save
helterskelter.save
