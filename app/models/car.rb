class Car < ApplicationRecord
  belongs_to :user
  belongs_to :model
  validates :model_id, presence: true
  validates :user_id, presence: true
  accepts_nested_attributes_for :model
  has_attachments :photos, maximum: 5
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
