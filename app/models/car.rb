class Car < ApplicationRecord
  belongs_to :user
  belongs_to :model
  validates :model_id, presence: true
  validates :user_id, presence: true
  accepts_nested_attributes_for :model
  has_attachments :photos, maximum: 5
<<<<<<< HEAD
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
=======
  has_many :appointments, dependent: :destroy

  def busy_days
    busy = []
    self.appointments.each do |appointment|
        busy << appointment.appointment_time
    end
    return busy
  end


>>>>>>> master
end
