# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Destroy all Data
Flight.delete_all
Airport.delete_all

# Airport
airports = [
  { id: 1, airport_id: 'BKK', location: 'Bangkok' },
  { id: 2, airport_id: 'PEK', location: 'Beijing' },
  { id: 3, airport_id: 'PVG', location: 'Shanghai' },
  { id: 4, airport_id: 'SIN', location: 'Singapore' },
  { id: 5, airport_id: 'HND', location: 'Tokyo' }
]

airports.each do |airport_params|
  Airport.create(airport_params)
end

# Flights
# Create 150 random flights across 31 days in March 200

# Generate Flight_No.
def gen_flight_no
  characters_arr = Array('A'..'Z')
  numbers_arr = Array(100..400)
  flights_arr = []

  150.times do
    flights_arr.push(
      characters_arr.sample + characters_arr.sample + numbers_arr.sample.to_s
    )
  end

  flights_arr
end

flights_arr = gen_flight_no

# Generate a random day in March 2003
time_arr = []

year = 2003
month = 3
second = 0

# Generate a random journey between two city
journey_arr = []

# Generate time and journey
150.times do
  # Time
  day = Array(1..31).sample
  hour = Array(0..23).sample
  minute = Array(0..59).sample
  time_arr << DateTime.new(year, month, day, hour, minute, second)
  # Journey
  journey_arr << Array(1..5).sample(2).uniq
end

# Generate Flights
150.times do |i|
  flight_info = {
    id: i + 1,
    flight_no: flights_arr[i],
    departing_time: time_arr[i],
    # Fill in the departing and arriving city id
    depart: Airport.find(journey_arr[i][0]),
    arrive: Airport.find(journey_arr[i][1])
  }
  Flight.create(flight_info)
end
