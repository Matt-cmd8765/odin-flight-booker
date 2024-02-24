class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 
  belongs_to :booking
end
