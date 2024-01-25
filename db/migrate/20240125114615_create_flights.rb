class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.references :departure_airport, index: true, foreign_key: { to_table: :airports}
      t.references :arrival_airport, index: true, foreign_key: {to_table: :airports}
      t.datetime :start
      t.integer :flight_duration

      t.timestamps
    end
  end
end
