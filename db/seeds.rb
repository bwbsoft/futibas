# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.create(name: genre_name)
#   end

# Create a user
admin = User.create(name: "Admin", email: "admin@dev.com", password: "teste1234", cpf: "066.207.627-35", role: :admin) # CPF is Fake
user = User.create(name: "User", email: "user@dev.com", password: "teste1234", cpf: "678.694.022-65", role: :player) # CPF is Fake
group = Group.create(name: "Soccer", user: user, notes: "Soccer group")

places = [
  Place.create(
    name: 'Arena do Grêmio',
    uf: 'RS',
    city: 'Porto Alegre',
    district: 'Humaitá',
    address: 'Av. Padre Leopoldo Brentano, 110',
    phone: '555130929605',
    website: 'https://arenapoa.com.br',
    instagram: 'arenapoa',
  ),
  Place.create(
    name: 'Soccer City',
    uf: 'RS',
    city: 'Porto Alegre',
    district: 'Navegantes',
    address: 'Rua Lauro Muller, nº 700',
    phone: '5551995451755',
    website: 'https://www.soccercitypoa.com.br/',
    instagram: 'soccercitypoa',
  ),
  Place.create(
    name: 'A Bombonera',
    uf: 'RS',
    city: 'Porto Alegre',
    district: 'São João',
    address: 'Av. Ceará, 561',
    phone: '555133603030',
    website: 'https://biolink.info/abombonera',
    instagram: 'abomboneraquadras',
  ),
]

game = Game.create!(
  group: group,
  user: user,
  place: places.sample,
  date: 2.days.from_now,
  title: 'Soccer Game ' + 2.days.from_now.strftime('%d/%m/%Y %H:%M'),
  user: user,
)

20.times do |n|
  Player.create!(
    group: group,
    name: Faker::Name.name + ' ' + n.to_s,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    instagram: Faker::Internet.username,
    picture: Faker::Avatar.image,
    notes: Faker::Markdown.emphasis
  )
end