# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

['Moving Helping', 'Handy Man', 'Cleaning', 'Shppoing and Delivery', 'Party and Events'].each do |category|
  Category.create(name: category)
end

Category.all.each do |category|
  Task.create(
    title: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    company: Faker::Company.name,
    url: Faker::Internet.url(host: 'example.com'),
    category_id: category.id
  )
end
