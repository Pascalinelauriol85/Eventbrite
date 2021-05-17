# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Event.destroy_all


10.times do |i|
  User.create(first_name:Faker::Games::Pokemon.name,
    last_name:Faker::Games::SuperMario.character,
    description:Faker::Movies::BackToTheFuture.quote,
    email:"john.lolo#{i}@yopmail.com")
  puts "#{i+1} users created"
end


10.times do |i|
  e = Event.create(start_date:Faker::Date.between(from: Date.today, to:100.days.after),
  duration:[5,10,15,20,25,30,35,40,45].sample,
  title:Faker::Movies::BackToTheFuture.quote,
  description:Faker::TvShows::NewGirl.quote,
  price:rand(1..1000),
  location:Faker::JapaneseMedia::Naruto.character,
  admin_id:User.all.sample.id)
  puts "#{i+1} events created"
end


50.times do |i|
  Attendance.create(user_id:User.all.sample.id,
    event_id:Event.all.sample.id, stripe_customer_id:"1569#{i}")
    puts "#{i+1} attendance created"  
end