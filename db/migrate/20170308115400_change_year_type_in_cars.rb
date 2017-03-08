class ChangeYearTypeInCars < ActiveRecord::Migration[5.0]
  def change
    change_column :cars, :year, 'integer USING CAST(year AS integer)'
  end
end
