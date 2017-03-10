class Appointment < ApplicationRecord
  belongs_to :user #buyer can see via this
  belongs_to :car #seller can see via this
  validates :user_id, presence: true
  validates :car_id, presence: true
  validates :appointment_date, presence: true
  validates :appointment_time, presence: true

  after_create :send_appointment_email

  private

  def send_appointment_email
    UserMailer.notify_owner(self).deliver_now
    UserMailer.notify_buyer(self).deliver_now
  end
end
