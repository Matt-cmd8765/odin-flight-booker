class CreateAiports < ActiveRecord::Migration[7.0]
  def change
    create_table :aiports do |t|
      t.string :code

      t.timestamps
    end
  end
end
