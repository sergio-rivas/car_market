require 'json'
require 'open-uri'

class Car < ApplicationRecord
  belongs_to :user
  belongs_to :model
  validates :model_id, presence: true
  validates :user_id, presence: true
  validates :price, presence: true
  accepts_nested_attributes_for :model
  has_attachments :photos, maximum: 5

  has_many :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy

  def busy_days
    busy = []
    self.appointments.each do |appointment|
        busy << appointment.appointment_time
    end
    return busy
  end

  def self.vin_data_parse(vin)
    url = "https://api.edmunds.com/api/vehicle/v2/vins/#{vin}?fmt=json&api_key=#{ENV['EDMUNDS_KEY']}"
    serialized = open(url).read
    data_hash = JSON.parse(serialized)
    new_search = SearchDatum.new(metadata: data_hash)
    new_search.save!
    return data_hash
  end

  def self.vin_data_extract(data_hash)
    useful = {}
    useful[:mpg_city] = data_hash["MPG"]["city"]
    useful[:mpg_highway] = data_hash["MPG"]["highway"]
    useful[:year] = data_hash["years"][0]["year"]
    useful[:vin] = data_hash["vin"]
    useful[:size] = data_hash["categories"]["EPAClass"]
    useful[:style] = data_hash["categories"]["vehicleStyle"]
    useful[:price_suggested] = data_hash["price"]["usedPrivateParty"]
    if data_hash["colors"]
      data_hash["colors"].each do |data|
        useful[:color_ext] = data["options"][0]["name"] if data["category"] == "Exterior"
        useful[:color_int] = data["options"][0]["name"] if data["category"] == "Interior"
      end
    end
    if data_hash["transmission"]
      useful[:trans_speeds] = data_hash["transmission"]["numberOfSpeeds"]
      useful[:trans_type] = data_hash["transmission"]["automaticType"]
    end
    useful[:doors] = data_hash["numOfDoors"]
    useful[:drive] = data_hash["drivenWheels"]
    return useful
  end

  def brand
    self.model and self.model.brand
  end







end
