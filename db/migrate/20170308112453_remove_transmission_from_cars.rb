class RemoveTransmissionFromCars < ActiveRecord::Migration[5.0]
  def change
    remove_column :cars, :transmission, :string
  end
end
