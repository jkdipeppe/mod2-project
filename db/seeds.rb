# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Guest.destroy_all
Band.destroy_all
Venue.destroy_all
Ticket.destroy_all
Show.destroy_all

genres = [
  "Blues",
  "Classic Rock",
  "Country",
  "Dance",
  "Disco",
  "Funk",
  "Grunge",
  "Hip-Hop",
  "Jazz",
  "Metal",
  "New Age",
  "Oldies",
  "Other",
  "Pop",
  "R&B",
  "Rap",
  "Reggae",
  "Rock",
  "Techno",
  "Industrial",
  "Alternative",
  "Ska",
  "Death Metal",
  "Pranks",
  "Soundtrack",
  "Euro-Techno",
  "Ambient",
  "Trip-Hop",
  "Vocal",
  "Jazz+Funk",
  "Fusion",
  "Trance",
  "Classical",
  "Instrumental",
  "Acid",
  "House",
  "Game",
  "Sound Clip",
  "Gospel",
  "Noise",
  "Alternative Rock",
  "Bass",
  "Soul",
  "Punk",
  "Space",
  "Meditative",
  "Instrumental Pop",
  "Instrumental Rock",
  "Ethnic",
  "Gothic",
  "Darkwave",
  "Techno-Industrial",
  "Electronic",
  "Pop-Folk",
  "Eurodance",
  "Dream",
  "Southern Rock",
  "Comedy",
  "Cult",
  "Gangsta",
  "Top 40",
  "Christian Rap",
  "Pop/Funk",
  "Jungle",
  "Native US",
  "Cabaret",
  "New Wave",
  "Psychadelic",
  "Rave",
  "Showtunes",
  "Trailer",
  "Lo-Fi",
  "Tribal",
  "Acid Punk",
  "Acid Jazz",
  "Polka",
  "Retro",
  "Musical",
  "Rock & Roll",
  "Hard Rock",
  "Folk",
  "Folk-Rock",
  "National Folk",
  "Swing",
  "Fast Fusion",
  "Bebob",
  "Latin",
  "Revival",
  "Celtic",
  "Bluegrass",
  "Avantgarde",
  "Gothic Rock",
  "Progressive Rock",
  "Psychedelic Rock",
  "Symphonic Rock",
  "Slow Rock",
  "Big Band",
  "Chorus",
  "Easy Listening",
  "Acoustic",
  "Humour",
  "Speech",
  "Chanson",
  "Opera",
  "Chamber Music",
  "Sonata",
  "Symphony",
  "Booty Bass",
  "Primus",
  "Porn Groove",
  "Satire",
  "Slow Jam",
  "Club",
  "Tango",
  "Samba",
  "Folklore",
  "Ballad",
  "Power Ballad",
  "Rhythmic Soul",
  "Freestyle",
  "Duet",
  "Punk Rock",
  "Drum Solo",
  "Acapella",
  "Euro-House",
  "Dance Hall",
  "Goa",
  "Drum & Bass",
  "Club - House",
  "Hardcore",
  "Terror",
  "Indie",
  "BritPop",
  "Negerpunk",
  "Polsk Punk",
  "Beat",
  "Christian Gangsta Rap",
  "Heavy Metal",
  "Black Metal",
  "Crossover",
  "Contemporary Christian",
  "Christian Rock",
  "Merengue",
  "Salsa",
  "Thrash Metal",
  "Anime",
  "JPop",
  "Synthpop"
]

age = [18,21]

ticket_type = ["General Admission", "VIP", "General Admission"]

n = 20
m = 50

m.times do
  guest = Guest.create(
    picture: "#{Faker::Avatar.image}?set=set2",
    name: Faker::Name.name,
    age: rand(15..50),
    location: Faker::Address.state,
    username: Faker::Name.first_name,
    password: Faker::Name.last_name
  )
end
guest_pass = Guest.create(
  picture: "#{Faker::Avatar.image}?set=set2",
  name: Faker::Name.name,
  age: rand(15..50),
  location: Faker::Address.state,
  username: 'username',
  password: 'password'
)

10.times do
  band = Band.create(
    picture: "#{Faker::Avatar.image}?set=set3",
    name: Faker::RockBand.name,
    genre: genres[rand(1..genres.length)],
    bio: Faker::HowIMetYourMother.quote,
    username: Faker::Team.creature,
    password: Faker::Team.mascot,
    bandmates: [Faker::Name.name, Faker::Name.name, Faker::Name.name, Faker::Name.name].to_s.delete("[]")
  )
end
band_pass = Band.create(
  picture: "#{Faker::Avatar.image}?set=set3",
  name: Faker::RockBand.name,
  genre: genres[rand(1..genres.length)],
  bio: Faker::HowIMetYourMother.quote,
  username: 'imaband',
  password: 'imapassword',
  bandmates: [Faker::Name.name, Faker::Name.name, Faker::Name.name, Faker::Name.name].to_s.delete("[]")
)


10.times do
  venue = Venue.create(name: Faker::Hipster.word, location: Faker::Address.state, capacity: rand(100..500), min_age: age[rand(0..1)], cost: rand(1..25)*100)
end

n.times do
  show = Show.create(
    price: rand(1..10)*10,
    venue_id: rand(1..Venue.count),
    band_id: rand(1..Band.count),
    name: Faker::Science.element + ' ' + Faker::Superhero.power,
    date: (Faker::Time.between(DateTime.now, 1.year.from_now).to_datetime)
  )
end

1000.times do
  ticket = Ticket.create(guest_id: rand(1..Guest.all.count), show_id: rand(1..n), ticket_type: ticket_type[rand(0..2)], price: rand(1..10)*10)
end
