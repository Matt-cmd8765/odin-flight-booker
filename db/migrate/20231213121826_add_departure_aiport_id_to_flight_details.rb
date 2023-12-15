class AddDepartureAiportIdToFlightDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :flight_details, :departure_airport, :integer
  end
end
