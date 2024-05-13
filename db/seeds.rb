# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Spring clean
puts "clearing database"
Booking.destroy_all
Dog.destroy_all
User.destroy_all
puts "database cleared."
# Creating Users
puts "Seeding Users"
10.times do |i|
  new_user = User.create!(email: "abc#{i}@gmail.com", password: "password", name: Faker::Name.first_name, age: rand(18...80))
  puts "#{new_user.name} created."
end
puts "Created #{User.count} users."

# Creating Dogs
5.times do |i|
  new_dog = Dog.new(name: "Bork", age: rand(1..10), availability: true, breed: Dog::BREEDS.sample, description: "This is a fake-data dog for testing.", price: rand(1..20))
  new_dog.user = User.all.sample
  new_dog.save
end
puts "Created #{Dog.count} dogs."

# Creating example booking


puts "Seeding complete."
