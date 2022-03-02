# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Api::V1::Article.destroy_all
User.destroy_all

5.times do |i|
  User.create(
    email:"user#{i}@lorgere.com",
    password:"123456",
    password_confirmation:"123456"
  )
end

30.times do

  Api::V1::Article.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, user_id: User.all.sample.id)

end