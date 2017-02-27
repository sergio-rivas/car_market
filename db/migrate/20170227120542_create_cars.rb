class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.user :belongs_to

      t.timestamps
    end
  end
end
