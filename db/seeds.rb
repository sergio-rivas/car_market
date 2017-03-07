# require 'csv'
# require 'json'
# require 'open-uri'
require 'faker'


# # Brand & Model Seed:
# run:  rails db:data:load


# # CAR SEED:  (NOTE: Relies on having 3 users or more.)
# 50.times do
#   new_car_params = {}
#   new_car_params[:user_id] = [1, 2, 3].sample
#   new_car_params[:model_id] = rand(1..3644)
#   new_car_params[:price] = rand(3000..30000)
#   new_car_params[:color] = Faker::Color.color_name
#   new_car_params[:odometer] = "#{rand(2000..100000)} km"
#   new_car_params[:year] = rand(1990..2017)
#   new_car_params[:month] = rand(1..12)
#   new_car_params[:transmission] = ["automatic", "manual"].sample
#   new_car_params[:fuel_type] = ["gasoline", "diesel", "hybrid", "electric"].sample
#   new_car_params[:engine_power_cc] = "#{rand(2000..9000)} cc"
#   new_car_params[:engine_power_hp] = "#{new_car_params[:engine_power_cc][0..-4].to_i * rand(14..17)} hp"
#   new_car_params[:description] = "Nothing special to add."
#   # new_car_params[:address] = Faker::Address.street_address
#   new_car = Car.new(new_car_params)
#   new_car.save
# end

# BMW SEED:

# 17.times do
#   new_car_params = {}
#   new_car_params[:user_id] = [1, 2, 3].sample
#   new_car_params[:model_id] = rand(498..507)
#   new_car_params[:price] = rand(3000..30000)
#   new_car_params[:color] = Faker::Color.color_name
#   new_car_params[:odometer] = "#{rand(2000..100000)} km"
#   new_car_params[:year] = rand(1990..2017)
#   new_car_params[:month] = rand(1..12)
#   new_car_params[:transmission] = ["automatic", "manual"].sample
#   new_car_params[:fuel_type] = ["gasoline", "diesel", "hybrid", "electric"].sample
#   new_car_params[:engine_power_cc] = "#{rand(2000..9000)} cc"
#   new_car_params[:engine_power_hp] = "#{new_car_params[:engine_power_cc][0..-4].to_i * rand(14..17)} hp"
#   new_car_params[:description] = ["Great BMW w/ solid interior!", "Seats are a bit frayed. New carpets.", "There's some strange invisible stains you can only see with a black light."].sample
#   # new_car_params[:address] = Faker::Address.street_address
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

#USER SEED:
User.all.each do |user|
  user.phone_number = "+34652863683" if user.phone_number.nil?
  user.email = Faker::Internet.email if user.email.nil?
  user.first_name = Faker::Name.first_name if user.first_name.nil?
  user.last_name = Faker::Name.last_name if user.last_name.nil?
  user.save!
end















