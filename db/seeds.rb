# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'
# Event.destroy_all
Spot.destroy_all
User.destroy_all

5.times {
  photo = Faker::LoremFlickr.image(size: "380x460", search_terms: ['person'])
  file = URI.open(photo)
  user = User.create(username: Faker::FunnyName.name, email:Faker::Internet.email, phone_number:Faker::PhoneNumber.cell_phone, password:"123456",)
  user.photo.attach(io: file, filename: "spaceship.jpg", content_type: "image/jpg")
  user.save
}
10.times {
  user = User.all.to_a.sample
  category = ["Works", "Damage road", "Dangerous junction", "Accident"].sample
  street = ["Boulevard Adolphe Max",
            "Rue d'Aerschot",
            "Avenue Albert",
            "Chaussée d'Alsemberg",
            "Boulevard Anspach",
            "Rue Antoine Dansaert",
            "Boulevard Auguste Reyers",
            "Rue du Bailli",
            "Rue Belliard",
            "Boulevard Brand Whitlock",
            "Avenue Brugmann",
            "Boulevard du Centenaire",
            "Chaussée de Charleroi",
            "Avenue Charles Quint",
            "Avenue des Croix du Feu",
            "Avenue De Fré",
            "Boulevard de Smet de Naeyer",
            "Boulevard Edmond Machtens",
            "Boulevard Emile Jacqmain",
            "Boulevard de l'Empereur",
            "Avenue de l'Exposition",
            "Avenue de l'Exposition Universelle",
            "Avenue Fonsny",
            "Avenue Franklin Roosevelt",
            "Chaussée de Gand",
            "Boulevard Général Jacques",
            "Boulevard Général Wahis",
            "Chaussée de Haecht",
            "Avenue Houba de Strooper",
            "Boulevard de l'Impératrice",
            "Boulevard Industriel",
            "Chaussée d'Ixelles",
            "Avenue de Jette",
            "Chaussée de Jette",
            "Chaussée de La Hulpe",
            "Boulevard Lambermont",
            "Boulevard Lépold II",
            "Avenue Léopold III",
            "Rue de la Loi",
            "Boulevard Louis Mettewie",
            "Boulevard Louis Schmidt",
            "Avenue Louise",
            "Chaussée de Louvain",
            "Boulevard Maurice Lemonnier",
            "Rue du Marché aux Fromages",
            "Rue du Midi",
            "Chaussée de Mons",
            "Rue Neuve",
            "Chaussée de Ninove",
            "Boulevard Pachéco",
            "Boulevard Paepsem",
            "Avenue du Parc",
            "Avenue du Parc Royal",
            "Boulevard de la Plaine",
            "Boulevard Prince de Liège",
            "Avenue de la Reine",
            "Avenue de Roodebeek",
            "Rue Royale",
            "Boulevard Saint-Michel",
            "Boulevard du Souverain",
            "Rue de Stalle",
            "Boulevard Sylvain Dupuis",
            "Avenue de Tervueren",
            "Boulevard du Triomphe",
            "Quai des Usines",
            "Avenue Van Praet",
            "Avenue Van Volxem",
            "Rue Victor Hugo",
            "Avenue de Vilvorde",
            "Chaussée de Vleurgat",
            "Chaussée de Waterloo",
            "Chaussée de Wavre",
            "Avenue Wielemans Ceuppens",
            "Avenue Winston Churchill",
            "Boulevard de la Woluwe" ].sample
  num = rand(1..10)
  location = num.to_s + " " +street + " Brussels"
  Spot.create(comment:Faker::Lorem.sentence, category: category, user:user,location: location)
}
