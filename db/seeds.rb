require 'csv'
require 'json'
require 'open-uri'

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# filepath    = 'db/car_query_makes.csv'

# CSV.foreach(filepath, csv_options) do |row|
#   new_brand_params = {car_query_id: row['make_id'], brand_name: row['make_display']}
#   new_brand = Brand.new(new_brand_params)
#   new_brand.save
# end
(61..155).to_a.each do |i|
  brand = Brand.find(i)
  make = brand.car_query_id
  url = "https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getModels&make=#{make}"
  serialized = open(url).read
  models = JSON.parse(serialized[2..-3])["Models"]
  models.each do |model|
    model_params = {name: model["model_name"], brand_id: brand.id}
    new_model = Model.new(model_params)
    new_model.save
  end
end
