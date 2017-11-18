require 'carrierwave'
require 'csv'

class CsvUploader < CarrierWave::Uploader::Base
  storage :file
  after :store, :clean_duplicate_rows

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[csv]
  end

  def clean_duplicate_rows(_file)
    csv_cleaned = []
    previous = ['', '0', '0']

    csv = CSV.read(path, col_sep: ';')
    csv.each do |row|
      row = [row[0], row[1].to_f.truncate(4), row[2].to_f.truncate(4)]
      csv_cleaned << row unless row[1] == previous[1] && row[2] == previous[2]
      previous = row
    end

    model.update(begin_at: Time.at(csv.first.first.to_i), end_at: Time.at(csv.last.first.to_i))
    
    CSV.open(path, 'w') do |row|
      csv_cleaned.each { |c| row << [c[0], c[1], c[2]] }
    end
    model.update(status: 'done')
  end
end
