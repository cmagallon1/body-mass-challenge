# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
body_mass = [
  { category: "Very severely underweight", min: 0, max: 15 },
  { category: "Severely underweight", min: 15, max: 16 },
  { category: "Underweight", min: 16, max: 18.5 },
  { category: "Normal", min: 18.5, max: 25 },
  { category: "Overweight", min: 25, max: 30 },
  { category: "Obese class I", min: 30, max: 35 },
  { category: "Obese class II", min: 35, max: 40},
  { category: "Obese class III", min: 40, max: 45},
  { category: "Obese class IV", min: 45, max: 50},
  { category: "Obese class V", min: 50, max: 60},
  { category: "Obese class VI", min: 60, max: 100 }
]

body_mass.each { |register| BodyMass.create(register) }
