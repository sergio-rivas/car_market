require 'twilio-ruby'

class Message < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :content, presence: true

  def send_message
    twilio_number = ENV['TWILIO_NUMBER']
    seller = self.car.user
    message_to_send = "Dear #{seller.first_name}! #{self.user.first_name} has sent you the following SMS: #{self.content}"

    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    self.content = message_to_send
    self.save

    client.messages.create(
      from: twilio_number,
      to:   '+34652863683',
      body: self.content,
    )
  end
end
