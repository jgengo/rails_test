require 'google_maps_service'
require 'csv'

class DistanceWorker
  include Sidekiq::Worker

  def perform(rental)
 #  	gmaps = GoogleMapsService::Client.new(key:  ENV["GAPI"], retry_timeout: 20, queries_per_second: 10)
 #    km = 0
 #    origins = nil
 #    CSV.read(rental.csv.path, {col_sep: ','}) do |row|
 #    	if origins.nil?
 #    		origins = [row.second, row.third]
 #    	else
 #    		destinations = [row.second, row.third]
	#     	matrix = gmaps.distance_matrix(origins, destinations, mode: 'driving', language: 'fr-FR', units: 'metric')
	#     	raise "#{matrix}"
	#     end

	# end

	p '===================================='

  end
end
