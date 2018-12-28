# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create(
    name: 'Maki Maeda',
    email: 'shumbodynamedmaki@gmail.com',
    password: 'maki7022',
    admin: true
)

50.times do |n|
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.unique.email,
        password: 'password'
    )
end

5.times do |n|
    c = n+1
    category = Category.create!(
        title: "Category #{c}",
        description: "The more I learn, the more I realize I don’t know.")
        
        3.times do |n|
        w = n+1
        word= category.words.build(
             word: "Word #{w}"
             )
        
            3.times do |n|
            c = n+1
            word.choices.build(
                choice: "Choice #{c}",
                )
            end
            
            random = rand(0..2)
            word.choices[random].correct = true
            word.save!
        end
end


