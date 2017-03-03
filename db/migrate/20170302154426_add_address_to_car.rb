class AddAddressToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :address, :string
  end
end
