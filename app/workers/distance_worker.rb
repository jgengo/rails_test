require 'google_maps_service'
require 'csv'

class DistanceWorker
  include Sidekiq::Worker

  def perform(rental_id)
    rental = Rental.find(rental_id)
    gmaps = GoogleMapsService::Client.new(key: "AIzaSyDaZEpzFgKrU1qvwscaugg-IlHfadcRwxQ", retry_timeout: 20, queries_per_second: 10)
    km = 0
    origins = nil
    CSV.read(rental.csv.path).each do |row|
      if origins.nil?
        origins = [row.second, row.third]
      else
        destinations = [row.second, row.third]
        matrix = gmaps.distance_matrix([origins], [destinations], mode: 'driving', language: 'fr-FR', units: 'metric')
        origins = destinations
        km += matrix[:rows].first[:elements].first[:distance][:value]
      end
    end
    rental.update(distance: km)
  end
end
