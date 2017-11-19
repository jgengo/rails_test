class CreateRentalDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_details do |t|
      t.integer   :rental_id
      t.float     :origin_long
      t.float     :origin_lat
      t.float     :dest_long
      t.float     :dest_lat
      t.float     :distance
      t.datetime  :saved_at
      t.timestamps
    end
  end
end
