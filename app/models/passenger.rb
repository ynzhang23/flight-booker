class Passenger < ApplicationRecord
  has_and_belongs_to_many :flights
end
