class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.car :belongs_to
      t.user :belongs_to

      t.timestamps
    end
  end
end
