class Flight < ApplicationRecord
  has_many :flight_details
  has_many :airports, through: :flight_details
  # has_many :passengers
end
