class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :airport_id
      t.string :location

      t.timestamps
    end
  end
end
