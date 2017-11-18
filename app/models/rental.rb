class Rental < ApplicationRecord
  mount_uploader :csv, CsvUploader

  scope :status_done, -> { where(status: :done) }
  enum status: { incoming: 0, done: 1 }

  validates_presence_of :csv, on: [:update]
  after_update :calculate_distance, if: -> { !csv.nil? && status.to_sym == :done }

  def calculate_distance
    DistanceWorker.perform_async(id)
  end
end
