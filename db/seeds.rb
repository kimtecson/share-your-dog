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

aria_description = "Aria, the epitome of elegance and joy, is a long-haired German Shepherd with an unbelievably fluffy coat. With a tail that wags in perpetual motion, she exudes happiness and warmth wherever she goes. Whether bounding through open fields with grace and agility or showering her family with affectionate kisses, Aria embodies the playful spirit and unwavering loyalty that define her breed."
seed_descriptions = [
  "Picture a sleek, black-coated canine with soulful eyes and a playful spirit. This dog embodies loyalty and companionship, always ready for a game of fetch or a snuggle on the couch.",
  "Imagine a fluffy, medium-sized dog with a coat of soft, sandy fur and expressive brown eyes that seem to convey an endless well of affection. This canine companion is both gentle and energetic, always eager to explore the outdoors and cuddle up indoors.",
  "Imagine a sleek, muscular dog with a coat as dark as midnight and eyes that gleam with intelligence and curiosity. This canine exudes strength and confidence, moving with grace and purpose wherever it goes. Despite its imposing appearance, this dog is incredibly loyal and affectionate, forming deep bonds with its human companions.",
  "Visualize a small, fluffy bundle of joy with a coat as white as freshly fallen snow and eyes that sparkle with mischief and innocence. This pint-sized pup is overflowing with boundless energy and an insatiable curiosity about the world around it. Despite its diminutive size, it possesses a courageous spirit and a fierce loyalty to its human family.",
  "Imagine a majestic creature, with a coat of rich, golden fur that shimmers in the sunlight, and eyes that reflect wisdom beyond their years. This noble canine carries itself with an air of dignity and grace, yet its heart is filled with boundless love and loyalty. Whether bounding through open fields or resting by the hearth, its presence brings warmth and joy to those around it. ",
  "Picture a sturdy, medium-sized dog with a coat of rich, chocolate brown fur and eyes that gleam with intelligence and warmth. This canine companion is the epitome of loyalty and devotion, always by your side through thick and thin. With a wagging tail and a playful demeanor, it brings endless joy and laughter into your life."
];

# Creating Dogs
  new_dog = Dog.new(name: "Aria", age: rand(1..10), availability: true, breed: Dog::BREEDS.sample, description: aria_description, price: rand(100..200))
  new_dog.user = User.all.sample
  new_dog.photos.attach(io: File.open("app/assets/images/aria1.jpg"), filename: "aria1.jpg")
  new_dog.photos.attach(io: File.open("app/assets/images/aria2.jpg"), filename: "aria2.jpg")
  new_dog.photos.attach(io: File.open("app/assets/images/aria3.jpg"), filename: "aria3.jpg")
  new_dog.photos.attach(io: File.open("app/assets/images/aria4.jpg"), filename: "aria4.jpg")
  new_dog.photos.attach(io: File.open("app/assets/images/aria5.jpg"), filename: "aria5.jpg")
  new_dog.save
  puts "(Dog) #{new_dog.name} created, owned by #{new_dog.user.name}."

2.times do |i|
  photos = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'i', 'j']
  photos.each do |photo|
    new_dog = Dog.new(name: Faker::Name.first_name, age: rand(1..10), availability: true, breed: Dog::BREEDS.sample, description: seed_descriptions.sample, price: rand(100..200))
    new_dog.user = User.all.sample
    new_dog.photos.attach(io: File.open("app/assets/images/#{photo}.jpg"), filename: "aria1.jpg")
    new_dog.photos.attach(io: File.open("app/assets/images/#{photo}2.jpg"), filename: "aria2.jpg")
    new_dog.photos.attach(io: File.open("app/assets/images/#{photo}3.jpg"), filename: "aria3.jpg")
    new_dog.photos.attach(io: File.open("app/assets/images/aria4.jpg"), filename: "aria4.jpg")
    new_dog.photos.attach(io: File.open("app/assets/images/aria5.jpg"), filename: "aria5.jpg")
    new_dog.save
    puts "(Dog) #{new_dog.name} created, owned by #{new_dog.user.name}."
  end
end
puts "-- Created #{Dog.count} dogs."

# Creating example booking


puts "Seeding complete."
