require 'google_maps_service'

class DistanceWorker
  include Sidekiq::Worker

  def perform(*args)
    p '=============================================================================================='
  end
end
