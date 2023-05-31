class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :passport_no
      t.string :nationality

      t.timestamps
    end
  end
end
