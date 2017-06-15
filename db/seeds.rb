# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.create([{airport_code: 'SFO'}, {airport_code: 'NYC'}, {airport_code: 'LA'}])
Flight.create([{origin_id: 1, destination_id: 2, departure_date: '2017-06-12', duration: 120}])
Flight.create([{origin_id: 2, destination_id: 1, departure_date: '2017-08-12', duration: 120}])
Flight.create([{origin_id: 3, destination_id: 1, departure_date: '2017-08-12', duration: 140}])
