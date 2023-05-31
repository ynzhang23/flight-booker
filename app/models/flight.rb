class Flight < ApplicationRecord
  has_and_belongs_to_many :passengers
  belongs_to :depart, class_name: 'Airport'
  belongs_to :arrive, class_name: 'Airport'
end
