class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.integer :status
      t.string :csv
      t.float :distance
      t.datetime :begin_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
