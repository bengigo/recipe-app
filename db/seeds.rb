# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users - recipes - recipe foods - foods

puts "Seeding..."

# delete recipe foods
RecipeFood.destroy_all
# delete foods
Food.destroy_all
# delete recipes
Recipe.destroy_all
# delete users
User.destroy_all


# seed users
first_user = User.create(email: 'b@mail.com', name: 'Bengi')
# seed recipes

# seed foods

# seed recipe foods


puts "Seeding done"