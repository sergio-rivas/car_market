class Brand < ApplicationRecord
validates :brand_name, uniqueness: true
validates :car_query_id, uniqueness: true
has_many :models, dependent: :destroy
has_many :cars, through: :models, dependent: :destroy
end
