class Rental < ApplicationRecord

	mount_uploader :csv, CsvUploader

	after_update :calculate_distance

	def calculate_distance
		if !self.csv.nil? and self.status == 'done'
			DistanceWorker.perform_async(self)
		end
	end

end
