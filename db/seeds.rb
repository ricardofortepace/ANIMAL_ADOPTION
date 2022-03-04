require 'faker'
puts 'funcionando'
10.times do
  user = User.new(name: Faker::Name.name_with_middle, email: Faker::Internet.email, password: Faker::IDNumber.brazilian_citizen_number, address: "São Paulo")
  user.save!
  puts "#{user} created!"
  3.times do
    animal = Animal.new(specie: %w[cat dog].sample, genre: %w[male female].sample, age: rand(1..15), castrate: [true, false].sample, user: user)
    animal.save!
    puts "#{animal} created!"
  end
end
