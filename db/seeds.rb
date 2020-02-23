# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Board.create(name: 'US Billboard')
Board.create(name: 'EU Billboard')
Board.create(name: 'Country Billboard')

10.times do |i|
Artist.create(name: Faker::Artist.name)
  40.times do |s|
    artist.songs.create(
      name: Faker::Music.band,
      body: Faker::Quote.famous_last_words
    )
    end
  end

  puts "seeded"
