require 'faker'
  5.times do 
    user = User.new(
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
puts "#{Item.count} items created"