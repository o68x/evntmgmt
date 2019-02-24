# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Faker::Config.locale = 'fr'

20.times do |index|
  s = User.create(email: "#{Faker::Internet.username}@yopmail.com",
      password: "password",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Hipster.paragraph)
  s.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'icons8-anonymous-user-96.png')),
                      filename: 'icons8-anonymous-user-96.png',
                      content_type: 'image/png')
end

10.times do |index|
  s = Event.create(start_date: Faker::Date.forward(15),
      duration: rand(12..48) * 5,
      title: Faker::Quote.robin,
      description: Faker::Hipster.paragraph,
      price: rand(50..400),
      location: "#{Faker::Restaurant.name}, #{Faker::Address.street_address}",
      user_id: User.all.sample.id,
      validated: [true, false].sample,
      reviewed: [true, false].sample)
end

50.times do |index|
  s = Attendance.create(stripe_customer_id: "",
      user_id: User.all.sample.id,
      event_id: Event.all.sample.id)
end

# Ajouter un individu connu (admin d'un événement) et l'admin du site

  u = User.create(email: "adminevent@yopmail.com",
  password: "password",
  first_name: "Admin",
  last_name: "Event",
  description: Faker::Hipster.paragraph)
  u.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'icons8-anonymous-user-96.png')),
                      filename: 'icons8-anonymous-user-96.png',
                      content_type: 'image/png')

  Event.create(start_date: Faker::Date.forward(15),
  duration: rand(12..48) * 5,
  title: "On va voir si ça marche",
  description: Faker::Hipster.paragraph,
  price: rand(50..400),
  location: "#{Faker::Restaurant.name}, #{Faker::Address.street_address}",
  user_id: User.last.id,
  validated: true,
  reviewed: true)

  5.times do |index|
    s = Attendance.create(stripe_customer_id: "HIDDEN",
        user_id: User.all.sample.id,
        event_id: Event.last.id)
  end

  User.create(email: "admin@evntmgmt.com",
    password: "evntmgmt",
    first_name: "Admin",
    last_name: "Evntmgmt",
    description: Faker::Hipster.paragraph)

  Event.create(start_date: Faker::Date.forward(15),
  duration: rand(12..48) * 5,
  title: "On va voir",
  description: Faker::Hipster.paragraph,
  price: rand(50..400),
  location: "#{Faker::Restaurant.name}, #{Faker::Address.street_address}",
  user_id: User.last.id)

  5.times do |index|
    s = Attendance.create(stripe_customer_id: "HIDDEN",
        user_id: User.all.sample.id,
        event_id: Event.last.id)
  end
