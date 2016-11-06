# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all

Category.create! [
  {id: "1" ,name: "all"},
  {id: "2" ,name: "japanese"},
  {id: "3" ,name: "italian"},
  {id: "4" ,name: "moroccan"},
  {id: "5" ,name: "mexican"},
  {id: "6" ,name: "chinese"},
]
puts "Success: Category data loaded"
# Foodspot.destroy_all
#
# Foodspot.create! [
#   {id: "1" ,name: "Figaro"},
#   {id: "2" ,name: "Bar Spek"},
#   {id: "3" ,name: "Barra"},
#   {id: "4" ,name: "Ter Brugge"},
#   {id: "5" ,name: "Rdf"},
#   {id: "6" ,name: "chinese"},
# ]
# puts "Success: Category data loaded"
