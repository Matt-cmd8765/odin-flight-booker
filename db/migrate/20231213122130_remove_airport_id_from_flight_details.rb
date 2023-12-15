class RemoveAirportIdFromFlightDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :flight_details, :airport_id, :integer
  end
end
