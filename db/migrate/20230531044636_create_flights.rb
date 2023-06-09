class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :flight_no
      t.date :date
      t.time :time
      t.references :depart, null: false, foreign_key: { to_table: :airports }
      t.references :arrive, null: false, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
