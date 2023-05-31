class Passenger < ApplicationRecord
  has_and_belongs_to_many :flights, -> { uniq }

  # Prevent Passenger from having duplicate Flights
  validates :flight_id, uniqueness: { scope: :passenger_id }
end
