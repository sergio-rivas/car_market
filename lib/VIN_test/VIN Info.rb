require 'json'
Dir.chdir(File.dirname(__FILE__))
file = File.read("../lib/VIN_test/edmunds_VIN.json")
data_hash = JSON.parse(file)

# data_hash.each do |key, value|
#   puts key
#   puts value
# end
VIN = "2G1FC3D33C9165616"
useful = {}
new_brand = Brand.find_by brand_name: data_hash["make"]["name"]
new_model = Model.find_by name: data_hash["model"]["name"]
useful[:mpg_city] = data_hash["MPG"]["city"]
useful[:mpg_highway] = data_hash["MPG"]["highway"]
useful[:year] = data_hash["years"][0]["year"]
useful[:vin] = data_hash["vin"]
useful[:size] = data_hash["categories"]["EPAClass"]
useful[:style] = data_hash["categories"]["vehicleStyle"]
useful[:price_suggested] = data_hash["price"]["usedPrivateParty"]
useful[:color_ext] = data_hash["colors"][1]["options"][0]["name"]
useful[:color_int] = data_hash["colors"][0]["options"][0]["name"]
trans = data_hash["transmission"]["numberOfSpeeds"] + "-Speed " + data_hash["transmission"]["automaticType"]
useful[:transmission] = trans
useful[:doors] = data_hash["numOfDoors"]
useful[:drive] = data_hash["drivenWheels"]

puts useful


