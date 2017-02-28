class Car < ApplicationRecord
belongs_to :user
belongs_to :model
validates :model_id, presence: true
validates :user_id, presence: true
accepts_nested_attributes_for :model
end
