# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a user
user = User.find_or_create_by!(name: "Admin", email: "admin@dev.com", password: "admin", cpf: "066.207.627-35") # CPF is Fake
group = Group.find_or_create_by!(name: "Soccer", user: user, notes: "Soccer group")
places = [
  Place.find_or_create_by!(
    name: 'Arena do Grêmio'
    uf: 'RS'
    city: 'Porto Alegre'
    district: 'Humaitá'
    address: 'Av. Padre Leopoldo Brentano, 110'
    phone: '555130929605'
    website: 'https://arenapoa.com.br'
    instagram: 'arenapoa'
  ),
  Place.find_or_create_by!(
    name: 'Soccer City'
    uf: 'RS'
    city: 'Porto Alegre'
    district: 'Navegantes'
    address: 'Rua Lauro Muller, nº 700'
    phone: '5551995451755'
    website: 'https://www.soccercitypoa.com.br/',
    instagram: 'soccercitypoa'
  ),
  Place.find_or_create_by!(
    name: 'A Bombonera'
    uf: 'RS'
    city: 'Porto Alegre'
    district: 'São João'
    address: 'Av. Ceará, 561'
    phone: '555133603030'
    website: 'https://www.soccercitypoa.com.br/',
    instagram: 'abomboneraquadras'
  ),
]
