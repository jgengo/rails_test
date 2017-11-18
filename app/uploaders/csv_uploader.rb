require 'carrierwave'
require 'csv'

class CsvUploader < CarrierWave::Uploader::Base

  storage :file

  after :store, :callback_method
  def callback_method(file)
  	csv_cleaned = []
  	previous = ['', '0', '0']
  	CSV.read(self.path, {col_sep: ";"}).each do |row|
  		row = [row[0], row[1].to_f.truncate(4), row[2].to_f.truncate(4)]
  		csv_cleaned << row unless row[1] == previous[1] and row[2] == previous[2]
  		previous = row
  	end
  	CSV.open(self.path, 'w') do |csv|
  		csv_cleaned.each { |c| csv << [c[0], c[1], c[2]] }
  	end

  	self.model.update(status: 'done')
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(csv)
  end

end
