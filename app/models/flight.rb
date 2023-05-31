class Flight < ApplicationRecord
  has_and_belongs_to_many :passengers, -> { uniq }
  belongs_to :depart, class_name: 'Airport'
  belongs_to :arrive, class_name: 'Airport'

  # Prevent Flight from having duplicate passengers
  validates :passenger_id, uniqueness: { scope: :flight_id }
end
