class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.references :user
      t.references :model
      t.integer :price
      t.string :color
      t.string :odometer
      t.integer :year
      t.integer :month
      t.string :transmission
      t.text :description
      t.string :fuel_type
      t.string :engine_power_cc
      t.string :engine_power_hp


      t.timestamps
    end
  end
end
