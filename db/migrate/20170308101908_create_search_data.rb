class CreateSearchData < ActiveRecord::Migration[5.0]
  def change
    create_table :search_data do |t|
      t.jsonb :metadata

      t.timestamps
    end
  end
end
