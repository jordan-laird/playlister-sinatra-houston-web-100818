# Add seed data here. Seed your database with `rake db:seed`
Artist.destroy_all
Song.destroy_all
Genre.destroy_all

artist1 = Artist.create(name: "billy gibbons")
artist2 = Artist.create(name: "alanis morrisette")

song1 = Song.create(name: "songthings2genres", artist_id: 1)
song2 = Song.create(name: "songthings1genre", artist_id: 2)

genre1 = Genre.create(name: "pop")
genre2 = Genre.create(name: "pop2")

songgenre1 = SongGenre.create(song_id: 1, genre_id: 1)
songgenre2 = SongGenre.create(song_id: 1, genre_id: 2)
songgenre3 = SongGenre.create(song_id: 2, genre_id: 1)