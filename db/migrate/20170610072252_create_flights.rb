class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :origin_id
      t.integer :destination_id
      t.date :departure_date
      t.integer :duration
      t.timestamps
    end
  end
end
