class Model < ApplicationRecord
belongs_to :brand
has_many :cars
accepts_nested_attributes_for :brand
end
