class RentalDetail < ApplicationRecord
  #==== relations
  belongs_to :rental
  #====


  def self.add_an_entry(rental_id, origin, dest, km, saved_at)
    self.create(rental_id: rental_id, distance: km, origin_lat: origin.first, origin_long: origin.second, dest_lat: dest.first, dest_long: dest.second, saved_at: Time.at(saved_at))
  end
end