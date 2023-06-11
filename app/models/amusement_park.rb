class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides
  #^ep: 

  # def all_mechanics(park_name)
  #   Mechanic.joins(ride_mechanics: { ride: :amusement_park }).where(amusement_parks: { name: park_name }).distinct
  # end

  def all_rides(park_id)
    Ride.select("rides.*, AVG(mechanics.years_experience) AS average_experience")
    .joins(ride_mechanics: :mechanic)
    .where(amusement_park_id: park_id)
    .group("rides.id")
    .order("average_experience DESC")
  end
  # ep: over complicated and weird that it starts by calling another class, not a big deal but could be better
  # def all_rides
  #   rides.joins .....
  # end
end
