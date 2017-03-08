class SearchDatum < ApplicationRecord

  def self.standard_data
    collections = {
      size: ["Compact", "Midsize", "Fullsize", "XL"],
      style: ["Sedan", "SUV", "Pickup", "Minivan", "Hatchback", "Convertible", "Coupe", "Wagon"],
      trans_speeds: ["4", "5", "6", "7"],
      trans_type: ["Manual", "Automatic", "Shiftable automatic"],
      doors: ["2", "3", "4", "5"],
      drive: ["front wheel drive", "rear wheel drive", "four wheel drive"]
    }

    self.all.each do |search|
      collections[:size] << search.metadata["categories"]["EPAClass"]
      collections[:style] << search.metadata["categories"]["vehicleStyle"]
      collections[:trans_speeds] << search.metadata["transmission"]["numberOfSpeeds"]
      collections[:trans_type] << search.metadata["transmission"]["automaticType"]
      collections[:doors] << search.metadata["numOfDoors"]
      collections[:drive] << search.metadata["drivenWheels"]
    end

    collections.map do |key, value|
      collections[key] = value.uniq
    end

    return collections
  end

end
