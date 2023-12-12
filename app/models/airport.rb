class Airport < ApplicationRecord
  has_many :flight_details
  has_many :flights, through: :flight_details
end