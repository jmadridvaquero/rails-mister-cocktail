# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

json_string = JSON.load(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'))

json_string["drinks"].each do |ingr| 
  puts ingr
  Ingredient.create!(name: ingr["strIngredient1"])
end

rand_array = %w(a..z)
puts Ingredient.all.count
3.times do 
	cocktail = Cocktail.new(name: Faker::ChuckNorris.fact)
	cocktail.save!
	dose = Dose.create(cocktail_id: cocktail.id, description: 'tasty', ingredient_id: rand(1..Ingredient.all.count))
	dose = Dose.create(cocktail_id: cocktail.id, description: 'tasty1', ingredient_id: rand(1..Ingredient.all.count))
	dose = Dose.create(cocktail_id: cocktail.id, description: 'tasty2', ingredient_id: rand(1..Ingredient.all.count))
end

puts 'seeds completed'