class ChangeColumnTypeInFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :departing_time, :datetime
    remove_column :flights, :time
  end
end
