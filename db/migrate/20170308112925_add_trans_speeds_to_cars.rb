class AddTransSpeedsToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :trans_speeds, :string
  end
end
