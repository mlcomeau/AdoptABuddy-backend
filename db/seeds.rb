# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{name: "megan", email: "mlcomeau99@gmail.com", password: "password", zipcode: "97214", search_radius: 25}, {name:"paul", email:"wmind24@hotmail.com", password: "bruce", zipcode: "97214", search_radius: 10}])
