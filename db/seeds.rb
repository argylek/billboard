# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

billboard_names = ['US Billboard', 'EU Billboard', 'Country/Western Billboard']


billboard_names.each do |names|
  Billboard.create(name: names)
end

10.times do |i|
  artist = Artist.create(name: Faker::Artist.name)
  5.times do |s|
    artist.songs.create(name: Faker::Music::GratefulDead.song)
  end
end

puts "THINGS WERE SEEDED PROPERLY"
