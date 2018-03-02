# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'test@test.com',
             password:              'password',
             password_confirmation: 'password',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  email = "test-#{n + 1}@test.com"
  password = 'password'
  User.create!(email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

Question.create!(question: 'The bobcat is native to which continent?',
                 choice_a: 'Asia',
                 choice_b: 'Europe',
                 choice_c: 'North America',
                 choice_d: 'Africa',
                 correct_answer: 'c')

99.times do |n|
  question = "#{n + 1}-The bobcat is native to which continent?"
  Question.create!(question: question,
                   choice_a: 'Asia',
                   choice_b: 'Europe',
                   choice_c: 'North America',
                   choice_d: 'Africa',
                   correct_answer: 'c')
end
