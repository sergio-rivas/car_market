class AddParamsToCars < ActiveRecord::Migration[5.0]
  def change
  add_column :cars, :mpg_city, :string
  add_column :cars, :mpg_highway, :string
  add_column :cars, :vin, :string
  add_column :cars, :size, :string
  add_column :cars, :style, :string
  add_column :cars, :price_suggested, :string
  add_column :cars, :color_ext, :string
  add_column :cars, :color_int, :string
  add_column :cars, :doors, :string
  add_column :cars, :drive, :string
  change_column :cars, :year, :string
  remove_column :cars, :color
  remove_column :cars, :month
  end
end
