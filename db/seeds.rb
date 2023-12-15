# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Airport.create([{code: 'PHL'}])
# Airport.create([{code: 'NYC'}])
# Airport.create([{code: 'LAX'}])
# Airport.create([{code: 'SFO'}])

d1 = DateTime.new(2023,12,20,7,0,0)
t1 = '05:00:00'

Flight.create([{departure_airport_id: 3, arrival_airport_id: 1, start_time: d1 , duration: t1}])