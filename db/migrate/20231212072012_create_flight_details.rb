class CreateFlightDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :flight_details do |t|
      t.references :airport, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
