class AddTransTypeToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :trans_type, :string
  end
end
