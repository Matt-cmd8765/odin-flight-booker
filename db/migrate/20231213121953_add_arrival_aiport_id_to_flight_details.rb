class AddArrivalAiportIdToFlightDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :flight_details, :arrival_airport, :integer
  end
end
