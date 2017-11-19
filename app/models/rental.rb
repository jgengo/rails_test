class Rental < ApplicationRecord
  #==== relations
  has_many :rental_details
  #====

  #==== callbacks
  validates_presence_of :csv, on: [:update]
  after_update :calc_distance, if: -> { !csv.nil? && status_changed? && status.to_sym == :done }
  #====

  mount_uploader :csv, CsvUploader

  scope :status_done, -> { where(status: :done) }
  enum status: { incoming: 0, done: 1 }


  private def calc_distance
    DistanceWorker.perform_async(id)
  end
end
