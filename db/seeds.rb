require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'db/car_query_makes.csv'

CSV.foreach(filepath, csv_options) do |row|
  new_brand_params = {car_query_id: row['make_id'], brand_name: row['make_display']}
  new_brand = Brand.new(new_brand_params)
  new_brand.save
end

