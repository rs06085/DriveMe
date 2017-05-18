class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :type
      t.integer :year
      t.string :make
      t.string :model
      t.string :mileage
      t.string :qubic_capacity
      t.string :fuel_type
      t.string :transmission
      t.string :color
      t.integer :airbags
      t.integer :doors
      t.integer :seats
      t.text :description
      t.boolean :is_all_wheel
      t.boolean :is_air
      t.boolean :is_babyseat
      t.boolean :is_cd_player
      t.boolean :is_gps
      t.boolean :is_pet_friendly
      t.boolean :is_radio
      t.boolean :is_camera
      t.boolean :is_wedding_car
      t.integer :daily_price
      t.integer :weekly_price
      t.integer :daily_km
      t.integer :weekly_km
      t.string :pickup_address
      t.string :dropoff_address
      t.boolean :delivery
      t.integer :delivery_price
      t.date :insurance_expiry_date
      t.boolean :active

      t.timestamps
    end
  end
end
