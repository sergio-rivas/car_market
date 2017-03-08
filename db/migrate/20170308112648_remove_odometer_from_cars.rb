class RemoveOdometerFromCars < ActiveRecord::Migration[5.0]
  def change
    remove_column :cars, :odometer, :string
  end
end
