# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Preference.destroy_all

Preference.create(title: "Men's Fashion")
Preference.create(title: "Women's Fashion")
Preference.create(title: "Children's Fashion")


p "Preferences seeds complete"