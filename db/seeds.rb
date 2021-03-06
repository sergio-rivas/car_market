require 'csv'
require 'json'
require 'open-uri'
require 'faker'


# # Brand & Model Seed:
# run:  rails db:data:load

#USER SEED (FIRST CREATE 3 USERS!!!):
# User.all.each do |user|
#   user.phone_number = "+34652863683" if user.phone_number.nil?
#   user.email = Faker::Internet.email if user.email.nil?
#   user.first_name = Faker::Name.first_name if user.first_name.nil?
#   user.last_name = Faker::Name.last_name if user.last_name.nil?
#   user.save!
# end

# # CAR SEED:  (NOTE: Relies on having 3 users or more.)
# 50.times do
#   new_car_params = {}
#   new_car_params[:user_id] = [1, 2, 3].sample
#   new_car_params[:model_id] = rand(1..3644)
#   new_car_params[:price] = rand(3000..30000)
#   new_car_params[:odometer] = rand(2000..100000)
#   new_car_params[:year] = rand(1990..2017)
#   new_car_params[:trans_type] = ["Automatic", "Manual"].sample
#   new_car_params[:trans_speeds] = ["4", "5", "6", "7"].sample
#   new_car_params[:fuel_type] = ["gasoline", "diesel", "hybrid", "electric"].sample
#   # new_car_params[:engine_power_cc] = "#{rand(2000..9000)} cc"
#   # new_car_params[:engine_power_hp] = "#{new_car_params[:engine_power_cc][0..-4].to_i * rand(14..17)} hp"
#   new_car_params[:description] = "Nothing special to add."
#   new_car = Car.new(new_car_params)
#   new_car.save
# end

# BMW SEED:
# 17.times do
#   new_car_params = {}
#   new_car_params[:user_id] = [1, 2, 3].sample
#   new_car_params[:model_id] = rand(498..507)
#   new_car_params[:price] = rand(3000..30000)
#   new_car_params[:odometer] = rand(2000..100000)
#   new_car_params[:year] = rand(1990..2017)
#   new_car_params[:trans_type] = ["Automatic", "Manual"].sample
#   new_car_params[:trans_speeds] = ["4", "5", "6", "7"].sample
#   new_car_params[:fuel_type] = ["gasoline", "diesel", "hybrid", "electric"].sample
#   new_car_params[:description] = ["Great BMW w/ solid interior!", "Seats are a bit frayed. New carpets.", "There's some strange invisible stains you can only see with a black light."].sample
#   new_car = Car.new(new_car_params)
#   new_car.save
# end

# BMW IMAGES:
# Brand.find(25).cars.each do |car|
#   base = Rails.root.to_s + "/app/assets/images/BMW/"
#   photo_range = (1..20).to_a
#     p1 = photo_range.delete_at(rand(photo_range.length)).to_s + ".jpg"
#     p2 = photo_range.delete_at(rand(photo_range.length)).to_s + ".jpg"
#     p3 = photo_range.delete_at(rand(photo_range.length)).to_s + ".jpg"
#   car.photos = [File.open(base+p1, 'r'), File.open(base+p2, 'r'), File.open(base+p3, 'r')]
# end

# UPDATE PREVIOUS FAKED CARS TO FULL DATASET

# Car.all.each do |car|
#   car.mpg_city = rand(12..20).to_s if car.mpg_city.nil?
#   car.mpg_highway = rand(25..36).to_s if car.mpg_highway.nil?
#   car.year = rand(1990..2017).to_s if car.year.nil?
#   car.size = ["Compact", "Midsize", "Fullsize", "XL"].sample if car.size.nil?
#   car.style = ["Sedan", "SUV", "Pickup", "Minivan", "Hatchback", "Convertible", "Coupe", "Wagon"].sample if car.style.nil?
#   car.price_suggested = "13,000" if car.price_suggested.nil?
#   car.color_ext = Faker::Color.color_name
#   car.color_int = ["Brown", "Black", "Grey"].sample if car.color_int.nil?
#   car.doors = ["2", "4"].sample if car.doors.nil?
#   car.drive = ["front wheel drive", "rear wheel drive", "four weel drive"].sample if car.drive.nil?
#   car.save
# end

# # ADD 1st JSON to SEARCH_DATA
# file = File.read("lib/VIN_test/edmunds_VIN.json")
# data_hash = JSON.parse(file)
# new_search = SearchDatum.new(metadata: data_hash)
# new_search.save!
# DEMO_VIN_API--EDMUNDS:
# file = File.read("lib/VIN_test/edmunds_VIN.json")
# data_hash = JSON.parse(file)

# useful = {}
# new_brand = Brand.find_by brand_name: data_hash["make"]["name"]
# new_model = Model.find_by name: data_hash["model"]["name"]
# useful[:mpg_city] = data_hash["MPG"]["city"]
# useful[:mpg_highway] = data_hash["MPG"]["highway"]
# useful[:year] = data_hash["years"][0]["year"]
# useful[:vin] = data_hash["vin"]
# useful[:size] = data_hash["categories"]["EPAClass"]
# useful[:style] = data_hash["categories"]["vehicleStyle"]
# useful[:price_suggested] = data_hash["price"]["usedPrivateParty"]
# useful[:color_ext] = data_hash["colors"][1]["options"][0]["name"]
# useful[:color_int] = data_hash["colors"][0]["options"][0]["name"]
# useful[:trans_speeds] data_hash["transmission"]["numberOfSpeeds"]
# useful[:trans_type] = data_hash["transmission"]["automaticType"]
# useful[:transmission] = trans
# useful[:doors] = data_hash["numOfDoors"]
# useful[:drive] = data_hash["drivenWheels"]

# new_car = Car.new(useful)
# new_car.user_id = 3
# new_car.model = new_model
# new_car.save


# # HEROKU FINAL SEED

# Car.all.each do |car|
#   car.mpg_city = rand(12..20).to_s if car.mpg_city.nil?
#   car.mpg_highway = rand(25..36).to_s if car.mpg_highway.nil?
#   car.year = rand(1990..2017).to_s if car.year.nil?
#   car.size = ["Compact Cars", "Midsize Cars", "Fullsize Cars", "XL Cars"].sample if car.size.nil?
#   car.style = ["Sedan", "SUV", "Pickup", "Minivan", "Hatchback", "Convertible", "Coupe", "Wagon"].sample if car.style.nil?
#   car.price_suggested = "13,000" if car.price_suggested.nil?
#   car.color_ext = Faker::Color.color_name if car.color_ext.nil?
#   car.color_int = ["Brown", "Black", "Grey"].sample if car.color_int.nil?
#   car.doors = ["2", "4"].sample if car.doors.nil?
#   car.drive = ["front wheel drive", "rear wheel drive", "four wheel drive"].sample if car.drive.nil?
#   car.trans_type = ["Automatic", "Manual", "Shiftable automatic"].sample if car.trans_type.nil?
#   car.trans_speeds = ["5", "6"].sample if car.trans_speeds.nil?
#   car.odometer = rand(2000..100000) if car.odometer.nil?
#   car.price = rand(3000..30000) if car.price.nil?
#   car.save
# end

# 4WD fix
Car.all.each do |car|
  car.drive = "four wheel drive" if car.drive == "four weel drive"
  car.save
end


