# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

#Spring clean
puts "clearing database"
Booking.destroy_all
Dog.destroy_all
User.destroy_all
puts "database cleared."
# Creating Users
puts "Seeding Users"
meguro = ['Meguro River', 'Meguro Parasitological Museum','Rinshinomori Park', 'Tokyo Metropolitan Teien Art Museum', 'Gotokuji Temple','Yutenji Temple', 'Happoen Garden', 'Institute for Nature Study', 'Naka-Meguro Shopping Street', 'Meguro Sky Garden']

meguro.each_with_index do |address, i|
  new_user = User.create!(email: "abc#{i}@gmail.com", password: "password", name: Faker::Name.first_name, age: rand(18...80), address: address)
  puts "(User) #{new_user.name} created."
end
puts "-- Created #{User.count} users."

# Creating Dogs
16.times do |i|
  photos = ['aria1', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'i', 'j']
  photos.each do |photo|
    new_dog = Dog.new(name: Faker::Name.first_name, age: rand(1..10), availability: true, breed: Dog::BREEDS.sample, description: Faker::Books::Lovecraft.paragraph, price: rand(100..200))
    new_dog.user = User.all.sample
    new_dog.photos.attach(io: File.open("app/assets/images/#{photo}.jpg"), filename: "aria1.jpg")
    new_dog.photos.attach(io: File.open("app/assets/images/aria2.jpg"), filename: "aria2.jpg")
    new_dog.photos.attach(io: File.open("app/assets/images/aria3.jpg"), filename: "aria3.jpg")
    new_dog.photos.attach(io: File.open("app/assets/images/aria4.jpg"), filename: "aria4.jpg")
    new_dog.photos.attach(io: File.open("app/assets/images/aria5.jpg"), filename: "aria5.jpg")
    new_dog.save
    puts "(Dog) #{new_dog.name} created, owned by #{new_dog.user.name}."
  end
end
puts "-- Created #{Dog.count} dogs."

# Creating example booking


puts "Seeding complete."
