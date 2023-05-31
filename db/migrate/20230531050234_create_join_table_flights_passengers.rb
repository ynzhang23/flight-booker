class CreateJoinTableFlightsPassengers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :flights, :passengers do |t|
      t.index :flight_id
      t.index :passenger_id
    end
  end
end
