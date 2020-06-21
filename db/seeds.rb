# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

20.times do
	prenom = Faker::Name.first_name
	nom = Faker::Name.last_name
  User.create(
    first_name: prenom,
    last_name: nom,
    email: prenom+nom+"@yopmail.com",
    description: "je suis "+prenom+" , bonjour !",
    encrypted_password:"foobar"
	)
end

100.times do 
  Event.create(
    title: Faker::Hipster.word,
    description: Faker::Hipster.paragraph(sentence_count:2, supplemental:false,random_sentences_to_add:1),
    start_date: Time.now+3600*24*rand(180)+rand(3600*24),
    duration: 5*rand(12*24)+5,
    admin:User.all[rand(User.all.count)],
    price:rand(1..1000),
    location: Faker::Address.city
    )
end

50.times do
    Attendance.create(
        event:Event.all[rand(Event.all.count)],
        participant:User.all[rand(User.all.count)]
    )
end

