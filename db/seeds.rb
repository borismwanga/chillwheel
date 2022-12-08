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
}
puts "done 5 users"

19.times {
  user = User.all.to_a.sample
  category = ["Stolen bike"]
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
            "Boulevard de la Woluwe"].sample
  num = rand(1..30)
  location = num.to_s + " " +street + " Brussels"
  comment = ["It was a short relationship. And everyone warned me. My new bike is gone. Destiny?",
             "I dont know why I am posting it. I dont believe it is possible to find the bike in a city like this…",
             "Dont park here. I lost my bike. Be warned!",
             "AVOID THIS PLACE. I LOST MY BIKE AND I HEAR THAT THIS IS HAPPENING EVERY DAY. SOMEONE SHOULD REALLY DO SOMETHING ABOUT IT!!!!!!!!!!!!",
             "Can this be any worse than that? I stopped to by a favourite chocolate for my fiance and the bike is gone. And I missed the date. What next? ",
             "AnYone seen this bike? I lost it here. Please help",
             "PLEASE HELP. THIS BIKE WAS A GIFT FROM MY PARENTS.",
             "Mon vélo a été volé ce week-end. Si vous le voyez, merci d'avance pour m'en tenir informé.",
             "Quelqu'un m'a volé mon vélo cette nuit. On m'avait averti qu'il y avait de plus en plus de vols dans le quartier. Est-ce que la ville pourrait aménager quelques installations pour cadenasser proprement nos vélos ?",
             "Voici la photo de mon vélo volé cette nuit. Si quelqu'un le voit, merci de commenter mon post.",
             "I miss the safe feeling. Someone took my property. I was shopping and I am pretty sure that this were the guys sitting in fron of the shop! Anyone seen this bike? What should we do to make the area safer?",
             "Vélo volé ce mardi dernier à l'heure du midi.",
             "Hey, I lost a bike on this spot, yesterday around 5pm. Any chances to see it again?",
             "Quelqu'un a-t-il vu mon vélo ? Volé pendant ce week-end.",
             "All, this is disgusting. My kid went shopping and his bike is stolen! He cried a lot and I had to go to police. I want the community to pressure for more patrols on the street!",
             "On m'a volé mon vélo adoré ! Si quelqu'un le voit, j'offre une récompense.",
             "My bike was stolen while parking.",
             "This is ridiculous!!!! Thisi is a third bike in a year! Someone should be patrolling this place!"].sample
  photo_stolen = ["https://res.cloudinary.com/dajqoeco6/image/upload/v1670495501/stolen24_2_j9kolc.jpg",
                  "https://res.cloudinary.com/dajqoeco6/image/upload/v1670495523/stolen46_nni5w3.jpg"].sample
  file = URI.open(photo_stolen)
  spot_stolen = Spot.create(comment: comment, category: category, user: user,location: location)
  spot_stolen.photo.attach(io: file, filename: photo_stolen, content_type: "image/jpg")

}

puts "done 19 theft spots in Brussels"

# 19.times {
#   user = User.all.to_a.sample
#   category = ["Accident"].sample
#   street = ["Boulevard Adolphe Max",
#             "Rue d'Aerschot",
#             "Avenue Albert",
#             "Chaussée d'Alsemberg",
#             "Boulevard Anspach",
#             "Rue Antoine Dansaert",
#             "Boulevard Auguste Reyers",
#             "Rue du Bailli",
#             "Rue Belliard",
#             "Boulevard Brand Whitlock",
#             "Avenue Brugmann",
#             "Boulevard du Centenaire",
#             "Chaussée de Charleroi",
#             "Avenue Charles Quint",
#             "Avenue des Croix du Feu",
#             "Avenue De Fré",
#             "Boulevard de Smet de Naeyer",
#             "Boulevard Edmond Machtens",
#             "Boulevard Emile Jacqmain",
#             "Boulevard de l'Empereur",
#             "Avenue de l'Exposition",
#             "Avenue de l'Exposition Universelle",
#             "Avenue Fonsny",
#             "Avenue Franklin Roosevelt",
#             "Chaussée de Gand",
#             "Boulevard Général Jacques",
#             "Boulevard Général Wahis",
#             "Chaussée de Haecht",
#             "Avenue Houba de Strooper",
#             "Boulevard de l'Impératrice",
#             "Boulevard Industriel",
#             "Chaussée d'Ixelles",
#             "Avenue de Jette",
#             "Chaussée de Jette",
#             "Chaussée de La Hulpe",
#             "Boulevard Lambermont",
#             "Boulevard Lépold II",
#             "Avenue Léopold III",
#             "Rue de la Loi",
#             "Boulevard Louis Mettewie",
#             "Boulevard Louis Schmidt",
#             "Avenue Louise",
#             "Chaussée de Louvain",
#             "Boulevard Maurice Lemonnier",
#             "Rue du Marché aux Fromages",
#             "Rue du Midi",
#             "Chaussée de Mons",
#             "Rue Neuve",
#             "Chaussée de Ninove",
#             "Boulevard Pachéco",
#             "Boulevard Paepsem",
#             "Avenue du Parc",
#             "Avenue du Parc Royal",
#             "Boulevard de la Plaine",
#             "Boulevard Prince de Liège",
#             "Avenue de la Reine",
#             "Avenue de Roodebeek",
#             "Rue Royale",
#             "Boulevard Saint-Michel",
#             "Boulevard du Souverain",
#             "Rue de Stalle",
#             "Boulevard Sylvain Dupuis",
#             "Avenue de Tervueren",
#             "Boulevard du Triomphe",
#             "Quai des Usines",
#             "Avenue Van Praet",
#             "Avenue Van Volxem",
#             "Rue Victor Hugo",
#             "Avenue de Vilvorde",
#             "Chaussée de Vleurgat",
#             "Chaussée de Waterloo",
#             "Chaussée de Wavre",
#             "Avenue Wielemans Ceuppens",
#             "Avenue Winston Churchill",
#             "Boulevard de la Woluwe"].sample
#   num = rand(1..40)
#   location = num.to_s + " " +street + " Brussels"
#   comment = ["I had an accident while crossing an intersection on my bicycle.",
#              "Caused an accident by colliding with another bicycle",
#              "J'ai été témoin d'un accident entre un vélo et une voiture. Le cycliste est passé de justesse mais avait bien sa priorité. Dans un sale état, on l'a emporté en ambulance. J'espère qu'il s'en sort.",
#              "I had an accident with another bicycle because the bicycle path was narrow.",
#              "A tire got stuck in the tram tracks bumped into a fox I was hit by a car",
#              "The car came out from parking and bumped into my bicycle.",
#              "The road was not paved and I fell.",
#              "I crashed with car since sudden lane shift without paying attention.",
#              "On m'a rentré dedans. Une porte qui s'ouvre sans faire attention. Mon vélo est plié en deux.",
#              "Quatrième accident en l'espace de trois mois sur cette rue. L'aménagement pour les cyclistes est clairement à refaire. Il n'est pas sécure du tout.",
#              "i bumped into car door When a person parks to open their driver's side door along the road without looking",
#              "Une moto m'a percuté en sortant de sa place de parking.",
#              "Accident avec une trottinette. Elle roulait en sens inverse...",
#              "Crash entre deux vélos. Signalisation à revoir pour les deux sens !",
#              "J'avoue, j'étais en partie en tort, j'ai passé un feu à l'orange. Une voiture m'est rentré dedans. Pas même un 'pardon comment ça va' alors que je me suis retrouvé par terre au milieu de la chaussée.",
#              "Une camionnette s'est serrée sur la droite alors que clairement je roulais juste derrière elle, le conducteur aurait dû me voir dans son rétroviseur. Mon vélo s'est plié en deux. ",
#              "Temps de merde, grosse pluie. J'ai des bons pneus anti-glisse, mais là, la chaussée est vraiment glissante quand il pleut. Attention, par temps de pluie, préférez peut-être la rue parallèle, même si plus encombrée.",
#              "Je viens d'avoir un accident avec une voiture dans cette rue. Attention, les feux de signalisation ne fonctionnent pas. C'est un peu la jungle.",
#              "Attention accident entre un vélo et une voiture dans cette rue ce matin. Risque de petits débris sur la chaussée.",
#              "I had an accident on this road. When it rains, this road becomes very slippery. Appeal to the authorities, can't anything be done to improve the safety of cyclists?",
#              "This is the first time I have ridden in the streets of Brussels. I normally come from Amsterdam. You guys have a lot of work to do to improve the safety of cyclists! First day on your streets and my bike is already broken.",
#              "Amis cyclistes, attention dans cette rue. On prévoit des travaux et on vient de changer la signalétique. Déjà un accident entre une voiture et un vélo ce matin. La rue ne peut se prendre plus que dans un sens, le temps des travaux.",
#              "Un petit jeune à vélo s'est fait rentré dedans par une voiture. Il est parti tout bredouille, son vélo ne roulait plus. Le conducteur ne s'est même pas inquiété.",
#              "Bras cassé. J'ai eu un accident il y a une semaine dans cette rue avec une voiture quand je roulais bien à droite. Mon casque m'a sauvé !",
#              "Petit crash sans dégâts, mais faudrait que les autorités revoient l'organisation de la circulation sur ce tronçon.",
#              "J'ai eu un accident avec moto qui tentait de dépasser une voiture par la droite... Résultat, je me suis retrouvé dans la voiture.",
#              "Je roulais dans la rue tranquille, il n'y avait pas beaucoup de circulation et on m'est littéralement rentré dedans. J'ai rien compris.",
#              "Le conducteur a ouvert sa porte sans regarder dans son rétroviseur. J'ai fait un vol plané par-dessus sa porte. Je ne suis pas cassé, mais mon vélo oui.",
#              "Livreur à vélo depuis plus de cinq ans, j'en ai vu des vertes et des pas mûres. Aujourd'hui j'ai été pris en sandwich entre deux voitures. Plus de vélo !",
#              "I take this path every day. This street is really dangerous. I just had my third car accident in a month! Drivers don't know how to drive when it rains...",
#              "Ça fait plus de 30 ans que je roule quotidiennement à vélo. Jamais eu le moindre accident avant de m'installer à Bruxelles. Cette ville est très mal aménagée pour les cyclistes! En un ans que je vis ici, déjà 3 accidents.",
#              "I had signalled with my hand that I was turning to the right and I was hit from behind. A scooter ran into me. It was driving on the pavement and landed on the road without warning."].sample
#   Spot.create(comment: comment, category: category, user:user,location: location)
# }

# puts "done 34 crash spots in Brussels"

puts "seed done"
