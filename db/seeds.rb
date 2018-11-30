# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Criando o primeiro usuário ...'
User.create(name: 'Renan Shin', email: 'renanshin@gmail.com', cpf: 12312312312)
puts 'Criando a primeira assinatura ...'
Order.create(cel_model: 'Moto Osso', imei: 123123123, parcel_number: 1, user_id: 1, price: 123, status: 1)
