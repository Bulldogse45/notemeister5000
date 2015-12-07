# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 3.times.each do
   user = User.new
   user.email = Faker::Internet.email
   user.api_token = SecureRandom.hex
   user.save!
   2.times.each do
     note = Note.new
     note.user_id = user.id
     note.title = Faker::Book.title
     note.body = Faker::Lorem.sentences(2)
     note.tag_names = Faker::Lorem.words(4).join(", ")
     note.save!
   end
 end
