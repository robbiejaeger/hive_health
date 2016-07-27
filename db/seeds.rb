# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Site.create!(name: "Green Hills Farm",
            description: "Hives for polinating grove trees.",
            longitude: "-87.6298",
            latitude: "41.8781")
Site.create!(name: "Ft Collins Hives",
            description: "All the hives are here for you.",
            longitude: "-105.0844",
            latitude: "40.5853")
Site.create!(name: "The Denver Collonies",
            description: "Not what you think, but the bees are awesome here.",
            longitude: "-104.9903",
            latitude: "39.7392")
Site.create!(name: "Seattle Site",
            description: "The bees moved here from Portland.",
            longitude: "-122.3321",
            latitude: "47.6062")
