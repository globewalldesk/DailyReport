# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!(email: 'larry@everipedia.com', password: 'password',
             first_name: 'Larry', last_name: 'Sanger')
puts 'Created larry/admin account'

9.times do |user|
  User.create!(email: Faker::Internet.email,
               password: Faker::Internet.password(8),
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name)
end
puts 'Created 10 new Users'

10.times do |report|
  Report.create!(goal: Faker::Lorem.sentence, feat: Faker::Lorem.sentence,
                 user_id: User.last.id - report)
  older = Report.create!(goal: Faker::Lorem.sentence,
                         feat: Faker::Lorem.sentence,
                         user_id: User.last.id - report)
  oldest = Report.create!(goal: Faker::Lorem.sentence,
                          feat: Faker::Lorem.sentence,
                          user_id: User.last.id - report)
  odin_days_ago = 1.day.ago
  older.update(created_at: odin_days_ago, updated_at: odin_days_ago)
  dva_days_ago = 2.days.ago
  oldest.update(created_at: dva_days_ago, updated_at: dva_days_ago)
end
puts 'Created 30 new Reports'