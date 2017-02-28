class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :car_query_id
      t.string :brand_name

      t.timestamps
    end
  end
end
