class Brand < ApplicationRecord
validates :brand_name, uniqueness: true
validates :car_query_id, uniqueness: true

end
