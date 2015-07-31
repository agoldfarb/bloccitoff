require 'faker'

#Create Users
5.times do 
  User.new(
    name: Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )

  user.skip_confirmation!
  user.save!
end

users = User.all


puts "Seed Finished"
puts "#{User.count} users created"