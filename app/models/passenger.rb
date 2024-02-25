class Passenger < ApplicationRecord
  validates :name, presence: true, on: :create
  validates :email, presence: true, uniqueness: true, on: :create
  belongs_to :booking
end
