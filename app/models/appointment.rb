class Appointment < ApplicationRecord
  belongs_to :user #buyer can see via this
  belongs_to :car #seller can see via this
  validates :user_id, presence: true
  validates :car_id, presence: true
  validates :appointment_date, presence: true
  validates :appointment_time, presence: true
end
