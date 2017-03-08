class AddOdometerToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :odometer, :integer
  end
end
