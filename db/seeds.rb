# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Airport.create([{code:'LAX'},{code:'SYD'}, {code:'EWR'}])
# Airport.create(code:'ORL')

Flight.create(departure_airport: Airport.first, arrival_airport: Airport.second, start:DateTime.new(2024,1,2,6), flight_duration: 5)

# airports = Airport.all

# airports.each do |depart|
#   airports.reverse.each do |arrive|
#     next if depart == arrive
#       Flight.create(
#         start: DateTime.new(2024, rand(1..12), rand(1..25), rand(6..23), rand(0.59)),
#         flight_duration: rand(1..12),
#         departure_airport: depart,
#         arrival_airport: arrive
#       )
#   end
# end
